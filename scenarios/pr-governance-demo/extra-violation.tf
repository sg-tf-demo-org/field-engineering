##############################################################################
# EXTRA VIOLATION introduced by the bypass PR (demo/pr-governance-vuln).
# A developer tacks an unencrypted, untagged EBS volume onto the already
# non-compliant scenario and opens a PR directly against main, skipping the
# pre-PR mcp-tf-governance gate. The pr-governance.yml backstop must catch it.
#
# DO NOT APPLY.
##############################################################################

# Unencrypted standalone EBS volume:
#   * encrypted = false            (trivy + rego CSPM: aws_ebs_volume not encrypted)
resource "aws_ebs_volume" "scratch" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = false

  # NOTE: intentionally no tags.
}
