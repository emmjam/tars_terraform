resource "aws_sns_topic" "sftpplus_client" {
  name  = "${local.csi}-sftpplus-client"
  count = var.sftpplus_topic_count
}