resource "aws_cloudwatch_log_metric_filter" "sftpplus_client_failure" {
  name           = "SFTPPlus-clientFailure"
  pattern        = "?fail ?Fail ?FAIL ?Error ?ERROR ?error"
  log_group_name = var.sftpplus_client_log_group_name

  metric_transformation {
    name          = "SFTPPlus-clientFailure"
    namespace     = "${local.csi}-SFTPPlus-client"
    value         = "1"
    default_value = "0"
  }
}