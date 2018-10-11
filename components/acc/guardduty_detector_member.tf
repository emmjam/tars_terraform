resource "aws_guardduty_detector" "member" {
  count  = "${var.guardduty_member_enabled}"
  enable = "true"
}
