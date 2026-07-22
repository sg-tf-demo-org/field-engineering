package main

import rego.v1

# Region-restriction gate (Terraform plan JSON).
# Only us-east-1 is permitted. Enforced two ways:
#   1. The aws provider region (when expressed as a literal in the plan config).
#   2. Any disallowed AWS region token appearing in a *known* resource attribute
#      value (availability zones, explicit region attrs, etc). Unknown values
#      (e.g. ARNs computed at apply time) are absent from the plan and so cannot
#      be mis-flagged. "us-east-1a" matches only the allowed "us-east-1" token.
# Fail-closed.

allowed_region := "us-east-1"

region_pattern := `(?:us|eu|ap|sa|ca|me|af|il)-(?:gov-)?(?:east|west|north|south|central|northeast|southeast|northwest|southwest)-[0-9]`

# --- provider region literal ---
deny contains msg if {
	some name, cfg in input.configuration.provider_config
	cfg.name == "aws"
	region := cfg.expressions.region.constant_value
	region != allowed_region
	msg := sprintf("REGION-RESTRICTION: provider '%s' region '%s' is not permitted — only %s is allowed", [name, region, allowed_region])
}

# --- disallowed region token in any known resource attribute value ---
deny contains msg if {
	some r in tf_resources
	walk(r.values, [path, value])
	is_string(value)
	found := regex.find_n(region_pattern, value, -1)[_]
	found != allowed_region
	loc := concat("/", [sprintf("%v", [p]) | some p in path])
	msg := sprintf("REGION-RESTRICTION: disallowed region '%s' in %s (%s) at %s — only %s permitted", [found, r.address, r.type, loc, allowed_region])
}
