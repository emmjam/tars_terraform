resource "aws_db_parameter_group" "ibs-cluster-writer-par-group-2022-10-18" {
  name        = "${local.csi}-writer-parameter-group-2022-10-18"
  family      = "aurora-mysql5.7"
  description = "Parameter Group for IBS database writer nodes"

  parameter {
    name  = "event_scheduler"
    value = "ON"
  }
}
