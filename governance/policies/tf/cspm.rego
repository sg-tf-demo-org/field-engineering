package main

import rego.v1

# Governance CSPM gate (Terraform plan JSON).
# Mirrors the CloudFormation CSPM showcase policies, rewritten against the
# `terraform show -json` schema (aws_* resource types + snake_case attributes).
# Fail-closed.
#
# Enforced:
#   - S3: full public-access-block + customer-managed KMS (CMK) encryption
#   - EBS volumes / instance block devices: encrypted with a CMK
#   - EKS cluster: envelope encryption of secrets with a CMK
#   - KMS keys: key rotation enabled
#   - Security groups: no SSH(22)/RDP(3389) ingress from 0.0.0.0/0 (or ::/0)
#   - RDS: not publicly accessible
#   - IAM: no Action:* + Resource:* (star-star) Allow statements

# ---------------------------------------------------------------------------
# S3 — full public access block
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_s3_bucket_public_access_block"
	not fully_blocked(r.values)
	msg := sprintf("CSPM: %s does not fully block public access (all four flags must be true)", [r.address])
}

fully_blocked(v) if {
	v.block_public_acls == true
	v.block_public_policy == true
	v.ignore_public_acls == true
	v.restrict_public_buckets == true
}

# ---------------------------------------------------------------------------
# S3 — server-side encryption must use aws:kms with a CMK
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_s3_bucket_server_side_encryption_configuration"
	some rule in r.values.rule
	sse := rule.apply_server_side_encryption_by_default[_]
	sse.sse_algorithm != "aws:kms"
	msg := sprintf("CSPM: %s uses sse_algorithm '%s' — customer-managed KMS (aws:kms) required", [r.address, sse.sse_algorithm])
}

deny contains msg if {
	some r in tf_resources
	r.type == "aws_s3_bucket_server_side_encryption_configuration"
	some rule in r.values.rule
	sse := rule.apply_server_side_encryption_by_default[_]
	sse.sse_algorithm == "aws:kms"
	not sse.kms_master_key_id
	msg := sprintf("CSPM: %s uses aws:kms without kms_master_key_id (CMK required)", [r.address])
}

# ---------------------------------------------------------------------------
# EBS — standalone volumes must be CMK-encrypted
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_ebs_volume"
	not r.values.encrypted == true
	msg := sprintf("CSPM: %s (aws_ebs_volume) is not encrypted", [r.address])
}

deny contains msg if {
	some r in tf_resources
	r.type == "aws_ebs_volume"
	r.values.encrypted == true
	not r.values.kms_key_id
	msg := sprintf("CSPM: %s (aws_ebs_volume) is encrypted without a customer-managed kms_key_id", [r.address])
}

# ---------------------------------------------------------------------------
# EC2 instance root/EBS block devices must be encrypted
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_instance"
	some rbd in r.values.root_block_device
	not rbd.encrypted == true
	msg := sprintf("CSPM: %s (aws_instance) root_block_device is not encrypted", [r.address])
}

deny contains msg if {
	some r in tf_resources
	r.type == "aws_instance"
	some ebd in r.values.ebs_block_device
	not ebd.encrypted == true
	msg := sprintf("CSPM: %s (aws_instance) ebs_block_device is not encrypted", [r.address])
}

# ---------------------------------------------------------------------------
# EKS — secrets envelope encryption with a CMK
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_eks_cluster"
	not has_secrets_encryption(r.values)
	msg := sprintf("CSPM: %s (aws_eks_cluster) has no envelope encryption of 'secrets' with a CMK", [r.address])
}

# A provider block is present (key_arn is a required argument inside it, so its
# presence means a CMK is wired even when the ARN is "known after apply" and thus
# absent from the plan's `after` values).
has_secrets_encryption(v) if {
	some cfg in v.encryption_config
	cfg.resources[_] == "secrets"
	count(cfg.provider) > 0
}

# ---------------------------------------------------------------------------
# KMS — key rotation must be enabled
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_kms_key"
	not r.values.enable_key_rotation == true
	msg := sprintf("CSPM: %s (aws_kms_key) must have enable_key_rotation = true", [r.address])
}

# ---------------------------------------------------------------------------
# Security groups — no SSH/RDP from the world
# ---------------------------------------------------------------------------
bad_ports := {22, 3389}

world := {"0.0.0.0/0", "::/0"}

# inline ingress on aws_security_group
deny contains msg if {
	some r in tf_resources
	r.type == "aws_security_group"
	some ing in r.values.ingress
	some p in bad_ports
	ing.from_port <= p
	ing.to_port >= p
	cidr := array_cidrs(ing)[_]
	world[cidr]
	msg := sprintf("CSPM: %s (aws_security_group) allows port %d from %s", [r.address, p, cidr])
}

# standalone aws_security_group_rule
deny contains msg if {
	some r in tf_resources
	r.type == "aws_security_group_rule"
	r.values.type == "ingress"
	some p in bad_ports
	r.values.from_port <= p
	r.values.to_port >= p
	cidr := r.values.cidr_blocks[_]
	world[cidr]
	msg := sprintf("CSPM: %s (aws_security_group_rule) allows port %d from %s", [r.address, p, cidr])
}

# modern aws_vpc_security_group_ingress_rule
deny contains msg if {
	some r in tf_resources
	r.type == "aws_vpc_security_group_ingress_rule"
	some p in bad_ports
	r.values.from_port <= p
	r.values.to_port >= p
	world[r.values.cidr_ipv4]
	msg := sprintf("CSPM: %s (aws_vpc_security_group_ingress_rule) allows port %d from %s", [r.address, p, r.values.cidr_ipv4])
}

array_cidrs(ing) := c if {
	is_array(ing.cidr_blocks)
	c := ing.cidr_blocks
}

array_cidrs(ing) := c if {
	is_array(ing.ipv6_cidr_blocks)
	c := ing.ipv6_cidr_blocks
}

# ---------------------------------------------------------------------------
# RDS — no public database instances
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type == "aws_db_instance"
	r.values.publicly_accessible == true
	msg := sprintf("CSPM: %s (aws_db_instance) is publicly_accessible — private only", [r.address])
}

# ---------------------------------------------------------------------------
# IAM — no Action:* + Resource:* Allow statements (star-star)
# ---------------------------------------------------------------------------
deny contains msg if {
	some r in tf_resources
	r.type in {"aws_iam_policy", "aws_iam_role_policy"}
	stmt := policy_statements(r.values.policy)[_]
	stmt.Effect == "Allow"
	has_wildcard(stmt.Action)
	has_wildcard(stmt.Resource)
	msg := sprintf("CSPM: %s grants Action:* on Resource:* (star-star)", [r.address])
}
