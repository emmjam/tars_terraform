resource "aws_rds_cluster_parameter_group" "ibs-cluster-parameter-group-2020-04-17" {
  name        = "${local.csi}-cluster-parameter-group-2020-04-17"
  family      = "aurora5.6"
  description = "Cluster Parameter Group for IBS databases"

  parameter {
    name         = "server_audit_logging"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "server_audit_logs_upload"
    value        = "1"
    apply_method = "pending-reboot"
  }

  parameter {
    name  = "aws_default_logs_role"
    value = aws_iam_role.ibs_rds_role.arn
  }

  parameter {
    name  = "server_audit_events"
    value = "CONNECT,QUERY,TABLE"
  }

}
