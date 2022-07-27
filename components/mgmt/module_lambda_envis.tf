module "envis" {
  source = "../../modules/lambda"

  project     = var.project
  component   = var.component
  environment = var.environment
  env_variables = {
    ENVIRONMENT = var.environment
  }

  s3_bucket = "tars-645711882182-eu-west-1-mgmt-mgmt-artefacts"
  s3_key    = "lambda-repo/packages/envis/envis-1.zip"

  name        = "envis"
  runtime     = "python3.8"
  memory_size = "512"
  handler     = "envis.lambda_handler"
  timeout     = "3"
  publish     = false

  cwlg_retention_in_days = "1"
}


resource "aws_lambda_permission" "envis" {
  statement_id  = "AllowExecutionFromElasticLoadBalancing"
  action        = "lambda:InvokeFunction"
  function_name = module.envis.function_name
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_alb_target_group.envis.arn
}
