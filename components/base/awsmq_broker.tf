# Create the AWS MQ Broker
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
  engine_type = "${var.aws_mq_engine_type}"
  engine_version = "${var.aws_mq_engine_version}"
  host_instance_type = "${var.aws_mq_host_instance_type}"
  deployment_mode = "${var.aws_mq_deployment_mode}"
  security_groups = ["${aws_security_group.tars-awsmq.id}"]
  user {
    username = "${var.aws_mq_users_admin_user}"
    password = "${var.aws_mq_users_admin_password}"
    groups   = ["${var.aws_mq_users_admin_group}"]
    console_access = true
  }
  user {
    username = "${var.aws_mq_users_tars_batch_user}"
    password = "${var.aws_mq_users_tars_batch_password}"
    groups   = ["${var.aws_mq_users_tars_batch_group}"]
    console_access = false
  }
  user {
    username = "${var.aws_mq_users_tars_messaging_user}"
    password = "${var.aws_mq_users_tars_messaging_password}"
    groups   = ["${var.aws_mq_users_tars_messaging_group}"]
    console_access = false
  }
  user {
    username = "${var.aws_mq_users_cpc_back_user}"
    password = "${var.aws_mq_users_cpc_back_password}"
    groups   = ["${var.aws_mq_users_cpc_back_group}"]
    console_access = false
  }
  subnet_ids = ["${module.tars_awsmq_subnets.subnet_ids}"]
  publicly_accessible = true
}
