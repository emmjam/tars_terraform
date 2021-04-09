resource "aws_sns_topic" "wms_unhealthy_host" {
  name  = "${local.csi}-wms-unhealthy-host"
  count = var.wms_host_alarm_count
}

resource "aws_sns_topic" "wms_cpu_utilization_too_high" {
  name  = "${local.csi}-wms-cpu_utilization_too_high"
  count = var.wms_host_alarm_count
}
