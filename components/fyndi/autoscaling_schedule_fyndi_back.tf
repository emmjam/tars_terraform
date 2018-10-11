resource "aws_autoscaling_schedule" "fyndi-b_down" {
  scheduled_action_name  = "${local.csi}/fyndi-b-down"
  min_size               = "${var.fyndi-b_asg_min_size}"
  max_size               = "${var.fyndi-b_asg_max_size}"
  desired_capacity       = "${var.fyndi-b_scaledown_desired}"
  recurrence             = "${var.fyndi-b_scaledown_recurrence}"
  autoscaling_group_name = "${module.fyndi-b.autoscaling_group_id}"
}

resource "aws_autoscaling_schedule" "fyndi-b_up" {
  scheduled_action_name  = "${local.csi}/fyndi-b-up"
  min_size               = "${var.fyndi-b_asg_min_size}"
  max_size               = "${var.fyndi-b_asg_max_size}"
  desired_capacity       = "${var.fyndi-b_scaleup_desired}"
  recurrence             = "${var.fyndi-b_scaleup_recurrence}"
  autoscaling_group_name = "${module.fyndi-b.autoscaling_group_id}"
}
