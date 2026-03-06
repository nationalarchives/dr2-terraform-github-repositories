module "configuration" {
  source  = "./da-terraform-configurations"
  project = "dr2"
}

module "github_preservica_client_repository" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/dr2-preservica-client"
  secrets = {
    WORKFLOW_TOKEN    = data.aws_ssm_parameter.github_workflow_token.value
    SLACK_WEBHOOK     = data.aws_ssm_parameter.github_slack_webhook.value
    SONATYPE_USERNAME = data.aws_ssm_parameter.github_sonatype_username.value
    SONATYPE_PASSWORD = data.aws_ssm_parameter.github_sonatype_password.value
    GPG_PRIVATE_KEY   = data.aws_ssm_parameter.github_gpg_key.value
    GPG_PASSPHRASE    = data.aws_ssm_parameter.github_gpg_passphrase.value
  }
}

module "custodial_copy" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/dr2-custodial-copy"
  secrets = {
    MANAGEMENT_ACCOUNT = data.aws_caller_identity.current.account_id
    SLACK_WEBHOOK      = data.aws_ssm_parameter.github_slack_webhook.value
    WORKFLOW_TOKEN     = data.aws_ssm_parameter.github_workflow_token.value
    GPG_KEY_ID         = data.aws_ssm_parameter.github_gpg_key_id.value
    GPG_PRIVATE_KEY    = data.aws_ssm_parameter.github_gpg_key.value
    GPG_PASSPHRASE     = data.aws_ssm_parameter.github_gpg_passphrase.value
  }
}

module "dr2_ingest" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/dr2-ingest"
  secrets = {
    MANAGEMENT_ACCOUNT = data.aws_caller_identity.current.account_id
    SLACK_WEBHOOK      = data.aws_ssm_parameter.github_slack_webhook.value
    WORKFLOW_TOKEN     = data.aws_ssm_parameter.github_workflow_token.value
    GPG_KEY_ID         = data.aws_ssm_parameter.github_gpg_key_id.value
    GPG_PRIVATE_KEY    = data.aws_ssm_parameter.github_gpg_key.value
    GPG_PASSPHRASE     = data.aws_ssm_parameter.github_gpg_passphrase.value
  }
}

module "dr2_ingest_environments" {
  for_each              = module.configuration.account_numbers
  source                = "git::https://github.com/nationalarchives/da-terraform-modules//github_environment_secrets"
  environment           = each.key
  repository_name       = "nationalarchives/dr2-ingest"
  team_slug             = "digital-records-repository"
  integration_team_slug = []
  secrets = {
    ACCOUNT_NUMBER = each.value
  }
}

module "dr2_runbooks" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/dr2-runbooks"
  secrets = {
    MANAGEMENT_ACCOUNT = data.aws_caller_identity.current.account_id
    WORKFLOW_TOKEN     = data.aws_ssm_parameter.github_workflow_token.value
  }
}

module "dr2_runbooks_environments" {
  for_each              = module.configuration.account_numbers
  source                = "git::https://github.com/nationalarchives/da-terraform-modules//github_environment_secrets"
  environment           = each.key
  repository_name       = "nationalarchives/dr2-runbooks"
  team_slug             = "digital-records-repository"
  integration_team_slug = []
  secrets = {
    ACCOUNT_NUMBER = each.value
  }
}

module "da-dp-holding-verification" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/da-dp-holding-verification"
  secrets = {
    WORKFLOW_TOKEN = data.aws_ssm_parameter.github_workflow_token.value
  }
}

module "dr2-farm-survey" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/dr2-farm-survey"
  secrets = {
    WORKFLOW_TOKEN = data.aws_ssm_parameter.github_workflow_token.value
  }
}

module "github_aws_clients_repository" {
  source          = "git::https://github.com/nationalarchives/da-terraform-modules//github_repository_secrets"
  repository_name = "nationalarchives/da-aws-clients"
  secrets = {
    WORKFLOW_TOKEN    = data.aws_ssm_parameter.github_workflow_token.value
    SLACK_WEBHOOK     = data.aws_ssm_parameter.github_slack_webhook.value
    SONATYPE_USERNAME = data.aws_ssm_parameter.github_sonatype_username.value
    SONATYPE_PASSWORD = data.aws_ssm_parameter.github_sonatype_password.value
    GPG_PRIVATE_KEY   = data.aws_ssm_parameter.github_gpg_key.value
    GPG_PASSPHRASE    = data.aws_ssm_parameter.github_gpg_passphrase.value
  }
}
