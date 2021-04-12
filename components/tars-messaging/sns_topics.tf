resource "aws_sns_topic" "wms_unhealthy_host" {
  name  = "${local.csi}-wms-unhealthy-host"
  count = var.wms_host_alarm_count
}
