resource "aws_sns_topic" "alerts" {
  name = "${local.csi}-alerts"

}
