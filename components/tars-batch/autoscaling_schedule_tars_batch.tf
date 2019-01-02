resource "aws_autoscaling_schedule" "tars_batch_down" {
  scheduled_action_name  = "${local.csi}/jenkins-down"
  min_size               = "${var.wildfly-batch_asg_min_size}"
  max_size               = "${var.wildfly-batch_asg_max_size}"
  desired_capacity       = "${var.wildfly-batch_scaledown_desired}"
  recurrence             = "${var.wildfly-batch_scaledown_recurrence}"
  autoscaling_group_name = "${module.tars_batch.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "tars_batch_up" {
  scheduled_action_name  = "${local.csi}/jenkins-up"
  min_size               = "${var.wildfly-batch_asg_min_size}"
  max_size               = "${var.wildfly-batch_asg_max_size}"
  desired_capacity       = "${var.wildfly-batch_scaleup_desired}"
  recurrence             = "${var.wildfly-batch_scaleup_recurrence}"
  autoscaling_group_name = "${module.tars_batch.autoscaling_group_id}"
}
