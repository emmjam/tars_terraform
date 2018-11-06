# Event rule to alert on failed ASG lifecycle actions
resource "aws_cloudwatch_event_target" "sns" {
  count = "${var.lifecycle_hook_launching_enabled}"

  rule = "${aws_cloudwatch_event_rule.failed_lifecycle_actions.name}"

  target_id = "${format(
    "%s-%s-%s",
    local.csi,
    var.name,
    "failed-lifecycle-actions-target"
  )}"

  arn = "${var.failed_lifecycle_action_sns_topic}"

  # We are using an input transformer on this occasion to get around the limitations of lambda-cloudwatch-slack. The transformed input has been crafted to ensure that lambda-cloudwatch-slack generates a useful output with enough information to be actionable. 

  input_transformer = {
    input_template = "${data.template_file.cw_event_target_input_template_failed_lifecycle_actions.rendered}"

    input_paths = {
      asg   = "$.detail.AutoScalingGroupName"
      cause = "$.detail.EC2InstanceId"
      event = "$.detail.StatusMessage"
    }
  }
}
