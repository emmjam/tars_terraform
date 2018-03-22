resource "aws_mq_broker" "tars-awsmq" {
  broker_name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "awsmq"
  )}"
  configuration {
    id = "${aws_mq_configuration.tars-awsmq.id}"
    revision = "${aws_mq_configuration.tars-awsmq.latest_revision}"
  }
  engine_type = "${lookup(var.aws_mq,"engine_type")}"
  engine_version = "${lookup(var.aws_mq,"engine_version")}"
  host_instance_type = "${lookup(var.aws_mq,"host_instance_type")}"
  deployment_mode = "${lookup(var.aws_mq,"deployment_mode")}"
  security_groups = ["${aws_security_group.tars-awsmq.id}"]
  user {
    username = "${lookup(var.aws_mq,"username")}"
    password = "${lookup(var.aws_mq,"password")}"
    console_access = true
  }
  subnet_ids = ["${data.terraform_remote_state.base.subnets_tars_awsmq}"]
  publicly_accessible = true
}
