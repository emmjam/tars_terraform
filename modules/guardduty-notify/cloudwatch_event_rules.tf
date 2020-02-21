resource "aws_cloudwatch_event_rule" "guardduty_slack" {
  name = "${local.csi}-guardduty-slack"

  event_pattern = <<PATTERN
  {
    "source": [
      "aws.guardduty"
    ],
    "detail-type": [
    "GuardDuty Finding"
    ]
  }
  PATTERN

  description = "Forwards GuardDuty alerts to Slack"
  is_enabled  = "true"
}

resource "aws_cloudwatch_event_rule" "guardduty_opsgenie" {
  name = "${local.csi}-guardduty-opsgenie"

  event_pattern = <<PATTERN
  {
    "source": [
      "aws.guardduty"
    ],
    "detail-type": [
    "GuardDuty Finding"
    ]
  }
  PATTERN

  description = "Forwards GuardDuty alerts to OpsGenie"
  is_enabled  = "true"
}
