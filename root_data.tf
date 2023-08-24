data "aws_caller_identity" "current" {}

data "aws_ssm_parameter" "github_workflow_token" {
  name = "/mgmt/github/token"
}

data "aws_ssm_parameter" "github_gpg_key" {
  name = "/mgmt/gpg/key"
}

data "aws_ssm_parameter" "github_gpg_key_id" {
  name = "/mgmt/gpg/id"
}

data "aws_ssm_parameter" "github_gpg_passphrase" {
  name = "/mgmt/gpg/passphrase"
}

data "aws_ssm_parameter" "github_slack_webhook" {
  name = "/mgmt/slack/webhook"
}

data "aws_ssm_parameter" "github_sonatype_username" {
  name = "/mgmt/sonatype/username"
}

data "aws_ssm_parameter" "github_sonatype_password" {
  name = "/mgmt/sonatype/password"
}

data "aws_ssm_parameter" "intg_account_number" {
  name = "/mgmt/intg_account_number"
}

data "aws_ssm_parameter" "staging_account_number" {
  name = "/mgmt/staging_account_number"
}

data "aws_ssm_parameter" "prod_account_number" {
  name = "/mgmt/prod_account_number"
}
