# NOTE: This AWS account already has the account-wide GitHub OIDC provider
# (token.actions.githubusercontent.com), so we reference it rather than
# re-create it. In a fresh account, set create_oidc_provider = true for exactly
# one environment to have the module provision it.
env_prefix           = "dev"
environment          = "dev"
vpc_cidr             = "10.20.0.0/16"
create_oidc_provider = false
