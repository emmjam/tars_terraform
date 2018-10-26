module "cwles_vpcflowlog" {
  source = "../../modules/cwles-vpcflowlog"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id                    = "${aws_vpc.vpc.id}"
  cwles_logstoes_lambda_arn = "${aws_lambda_function.logstoes.arn}"
}
