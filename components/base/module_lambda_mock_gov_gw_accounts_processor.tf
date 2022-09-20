module "lambda_mock_gov_gw_accounts_processor" {
  source = "../../modules/lambda-vpc"

  count       = var.mock_gov_gw_accounts_processor == true ? 1 : 0
  
  name        = "mock-gov-gw-accounts-processor"
  project     = var.project
  component   = var.component
  environment = var.environment

  s3_bucket = "tars-645711882182-eu-west-1-mgmt-mgmt-artefacts"
  s3_key    = "lambda-repo/packages/mock-gov-gw-accounts-processor/tars-mock-gov-gw-accounts-processor-function-${var.mock_gov_gw_accounts_processor_lambda_version}.zip"
  

  runtime     = "java8.al2"
  handler     = "uk.gov.dvsa.ggw.GGWMapperHandler"
  memory_size = 512
  timeout     = 900
  lambda_version             = var.mock_gov_gw_accounts_processor_lambda_version
  vpc_id                     = aws_vpc.vpc.id
  subnet_ids                 = module.tars_lambda_subnets.subnet_ids
  additional_security_groups = [aws_security_group.api_lambda_sg.id]

  env_variables = {
    ENVIRONMENT = var.environment
    ENV = var.environment
  }
  cwlg_retention_in_days = "3"
  default_tags = local.default_tags
  api_private_access_logs = "mock-gov-gw-accounts-processor"
}

