resource "aws_rds_cluster_parameter_group" "ibs-cluster-parameter-group-2020-04-17" {
  name        = "${local.csi}-cluster-parameter-group-2020-04-17"
  family      = "aurora5.6"
  description = "Cluster Parameter Group for IBS databases"

  parameter {
    name = "server_audit_logging"
    value = "1"
    apply_method = "pending-reboot"
  }

}