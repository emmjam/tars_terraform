module "lambda-holding-pages" {
  source = "../../modules/lambda-holding-pages"

  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  name                   = "lambda-holding-pages"
  runtime                = "nodejs12.x"
  handler                = "index.handler"
  timeout                = 3
  memory_size            = 128
  cwlg_retention_in_days = 30

}