resource "aws_guardduty_detector" "master" {
  count  = "${var.guardduty_master_enabled}"
  enable = "true"
}

resource "aws_guardduty_member" "members" {
  count              = "${length(var.guardduty_member_list)}"
  account_id         = "${lookup(var.guardduty_member_list[count.index], "account_id")}"
  detector_id        = "${aws_guardduty_detector.master.id}"
  email              = "${lookup(var.guardduty_member_list[count.index], "email")}"
  invite             = "true"
  invitation_message = "TARS Guardduty Invitation"
}
