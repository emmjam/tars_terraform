resource "aws_guardduty_detector" "master" {
  count  = "${var.guardduty_master_enabled}"
  enable = "true"
}
