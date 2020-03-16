################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "cpc" {
  name        = "${local.csi}-cpcdb"
  description = "${local.csi}-cpcdb"

  family = "oracle-se2-12.1"

  parameter {
    name         = "archive_lag_target"
    value        = "300"
    apply_method = "immediate"
  }

  parameter {
    name         = "audit_trail"
    value        = "DB"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_flashback_retention_target"
    value        = "4320"
    apply_method = "immediate"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "100"
    apply_method = "immediate"
  }

  parameter {
    name         = "recyclebin"
    value        = "ON"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "resource_limit"
    value        = "TRUE"
    apply_method = "immediate"
  }
}

