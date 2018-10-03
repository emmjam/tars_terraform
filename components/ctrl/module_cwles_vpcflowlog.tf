module "cwles_vpcflowlog" {
  source = "../../modules/cwles-vpcflowlog"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id = "${aws_vpc.ctrl.id}"

  cwles_logstoes_lambda_arn = "${data.terraform_remote_state.acc.cwles_logstoes_lambda_arn}"
}
