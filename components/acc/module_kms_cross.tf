module "kms_cross_account_ami" {
  source = "../../modules/cross-kms"

  project        = var.project
  environment    = var.environment
  component      = var.component
  aws_account_id = var.aws_account_id

  name            = "cross-account-kms"
  alias           = "alias/tars-mgmt-acc-ami-key"
  deletion_window = "30"

  default_tags = local.default_tags
}
