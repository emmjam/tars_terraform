# TODO: peacheym: Perhaps this resource should be called "master"
#                 as the member resources applied to the master detector?
resource "aws_guardduty_member" "members" {
  count              = length(var.guardduty_member_list)
  account_id         = var.guardduty_member_list[count.index]["account_id"]
  detector_id        = aws_guardduty_detector.master[0].id
  email              = var.guardduty_member_list[count.index]["email"]
  invite             = "true"
  invitation_message = "TARS Guardduty Invitation"
}

