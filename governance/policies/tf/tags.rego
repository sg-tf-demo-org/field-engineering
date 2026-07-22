package main

import rego.v1

# Mandatory-tags gate (Terraform plan JSON).
# Every taggable resource must carry the org-required tag keys (typically applied
# fleet-wide via the aws provider `default_tags`, surfaced as `tags_all` in the
# plan). Environment must be one of the approved enumerated values.
# Fail-closed.

required_tags := {"Owner", "CostCenter", "Environment"}

allowed_environments := {"dev", "staging", "prod"}

taggable := {
	"aws_s3_bucket",
	"aws_sqs_queue",
	"aws_sns_topic",
	"aws_lambda_function",
	"aws_dynamodb_table",
	"aws_instance",
	"aws_security_group",
	"aws_vpc",
	"aws_subnet",
	"aws_iam_role",
	"aws_iam_policy",
	"aws_kms_key",
	"aws_db_instance",
	"aws_eks_cluster",
	"aws_eip",
	"aws_nat_gateway",
}

# Missing one or more required tag keys.
deny contains msg if {
	some r in tf_resources
	taggable[r.type]
	provided := tag_keys(r)
	missing := required_tags - provided
	count(missing) > 0
	msg := sprintf("MANDATORY-TAGS: %s (%s) is missing required tags: %v", [r.address, r.type, missing])
}

# Environment tag must be from the enumerated set.
deny contains msg if {
	some r in tf_resources
	taggable[r.type]
	tags := effective_tags(r)
	env := tags.Environment
	env != null
	not allowed_environments[env]
	msg := sprintf("MANDATORY-TAGS: %s has Environment='%s' — allowed: %v", [r.address, env, allowed_environments])
}
