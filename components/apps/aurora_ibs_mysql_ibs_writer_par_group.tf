resource "aws_rds_cluster_parameter_group" "ibs-cluster-writer-par-group-2020-04-17" {
  name        = "${local.csi}-writer-parameter-group-2020-04-17"
  family      = "aurora5.6"
  description = "Parameter Group for IBS database writer nodes"

  parameter {
    name  = "event_scheduler"
    value = "ON"
  }
}
