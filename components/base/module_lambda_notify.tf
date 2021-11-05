module "lambda_notify" {

  source = "../../modules/lambda-vpc"

  name        = "notify-service"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  s3_bucket = "tars-nonprod-ctrl-resources"
  s3_key = "lambda-functions/tars-gov-notify.zip"
#  s3_key = "${format(
#    "%s-%s",
   # "${var.notify_lambda_version}.zip"
 #   "michelle-b998e0b1-4cc3-4df2-b64b-4dc28b02a8eb.zip"
#    lookup(var.api_notify, "s3_key_prefix"),
#  )}"

  runtime     = "java8"
  handler     = "uk.gov.notify.sms.SMSHandler"
  memory_size = 512
  timeout     = 5

  vpc_id                       = aws_vpc.vpc.id 
  subnet_ids  =  module.tars_lambda_subnets.subnet_ids
  additional_security_groups   = [aws_security_group.api_lambda_sg.id]

  principal_service  = "sqs"
  invoker_source_arn = "${aws_sqs_queue.send_gov_notify.arn}/*/*/*"

  env_variables = {
    env = var.environment
  }
  cwlg_retention_in_days = "${lookup(var.api_notify, "cwlg_retention_in_days")}"

  default_tags = "${local.default_tags}"
}
