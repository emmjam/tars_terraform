module "kms_apps_key" {
  source = "../../modules/kms"

  project     = var.project
  environment = var.environment
  component   = var.component

  name            = "key"
  alias           = "alias/tars-${var.environment}-key"
  deletion_window = "30"

  default_tags = local.default_tags
}
