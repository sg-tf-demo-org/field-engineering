package main

import rego.v1

# Shared helpers for the Terraform *plan-JSON* governance policies.
#
# These policies target the output of `terraform show -json tfplan.binary`, NOT
# CloudFormation. Resources are collected from two complementary places so the
# gate sees every resource regardless of module nesting:
#   1. .resource_changes[].change.after   (flat, authoritative "after" values)
#   2. .planned_values.root_module (+ .child_modules[]) .resources[].values
#      (reached via walk(), so arbitrarily deep module trees are covered)
#
# Each collected entry is normalized to {address, type, values}.

# --- from resource_changes (skip pure deletes; after == null on destroy) ---
tf_resources contains r if {
	some rc in input.resource_changes
	rc.change.after != null
	r := {
		"address": rc.address,
		"type": rc.type,
		"values": rc.change.after,
	}
}

# --- from planned_values, walked to any module depth ---
tf_resources contains r if {
	walk(input.planned_values, [_, node])
	is_object(node)
	is_string(node.address)
	is_string(node.type)
	is_object(node.values)
	r := {
		"address": node.address,
		"type": node.type,
		"values": node.values,
	}
}

# Effective tags for a resource: prefer tags_all (includes provider default_tags),
# fall back to tags, else empty.
effective_tags(r) := t if {
	is_object(r.values.tags_all)
	t := r.values.tags_all
}

effective_tags(r) := t if {
	not is_object(r.values.tags_all)
	is_object(r.values.tags)
	t := r.values.tags
}

effective_tags(r) := {} if {
	not is_object(r.values.tags_all)
	not is_object(r.values.tags)
}

tag_keys(r) := {k | some k, _ in effective_tags(r)}

# Parse an IAM policy document that is stored as a JSON string on the resource.
policy_statements(doc_str) := stmts if {
	is_string(doc_str)
	doc := json.unmarshal(doc_str)
	stmts := as_array(doc.Statement)
}

as_array(x) := x if is_array(x)

as_array(x) := [x] if not is_array(x)

has_wildcard(v) if v == "*"

has_wildcard(v) if {
	is_array(v)
	v[_] == "*"
}
