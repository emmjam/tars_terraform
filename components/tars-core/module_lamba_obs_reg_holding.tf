module "obs_reg_holding" {
  source = "../../modules/lambda"
  count  = var.obs_reg_holding == true ? 1 : 0

  project     = var.project
  component   = var.component
  environment = var.environment
  env_variables = {
    ENVIRONMENT = var.environment
  }

  s3_bucket = "tars-645711882182-eu-west-1-mgmt-mgmt-artefacts"
  s3_key    = "lambda-repo/packages/obs-reg-holding/obs_reg_holding_1.zip"

  name        = "obsregholding"
  runtime     = "python3.8"
  memory_size = "128"
  handler     = "obs_reg_holding.lambda_handler"
  timeout     = "1"
  publish     = false

  cwlg_retention_in_days = "7"
}

resource "aws_lambda_permission" "obs_reg_holding" {
  count         = var.obs_reg_holding == true ? 1 : 0
  statement_id  = "AllowExecutionFromElasticLoadBalancing"
  action        = "lambda:InvokeFunction"
  function_name = module.obs_reg_holding[count.index].function_name
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_alb_target_group.obs_reg_holding[count.index].arn
}
