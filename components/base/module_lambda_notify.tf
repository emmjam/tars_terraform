module "lambda_notify" {

  source = "../../modules/lambda-vpc"

  name        = "notify-service"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  s3_bucket = "tars-645711882182-eu-west-1-mgmt-mgmt-artefacts"
 # s3_bucket = "tars-nonprod-ctrl-resources"

  s3_key = "${format(
    "%s-%s",
    lookup(var.api_notify, "s3_key_prefix"),
    "${var.notify_lambda_version}.zip"
  )}"

  runtime     = "java8.al2"
  handler     = "uk.gov.dvsa.notify.sms.SMSNotifyHandler"
  memory_size = 512
  timeout     = 5
  lambda_version     = "${var.notify_lambda_version}"

  vpc_id                       = aws_vpc.vpc.id 
  subnet_ids  =  module.tars_lambda_subnets.subnet_ids
  additional_security_groups   = [aws_security_group.api_lambda_sg.id]

  principal_service  = "sqs"
  invoker_source_arn = "${aws_sqs_queue.send_gov_notify.arn}/*/*/*"

  env_variables = {
    ENV = var.environment
  }
  cwlg_retention_in_days = "${lookup(var.api_notify, "cwlg_retention_in_days")}"

  default_tags = "${local.default_tags}"
}
