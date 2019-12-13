module "kms_hieradata" {
  source = "../../modules/kms"

  project     = var.project
  environment = var.environment
  component   = var.component

  name            = "hieradata"
  alias           = "alias/hieradata"
  deletion_window = "30"

  default_tags = local.default_tags
}

