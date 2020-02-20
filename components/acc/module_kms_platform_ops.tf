module "kms_platform_ops" {
  source = "../../modules/kms"

  project     = var.project
  environment = var.environment
  component   = var.component

  name            = "platform-ops"
  alias           = "alias/platform-ops"
  deletion_window = "30"

  default_tags = local.default_tags
}
