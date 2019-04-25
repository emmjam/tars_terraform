module "cwles_vpcflowlog" {
  source = "../../modules/cwles-vpcflowlog"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id = "${aws_vpc.ctrl.id}"

}
