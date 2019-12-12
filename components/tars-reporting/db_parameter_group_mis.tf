################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "mis" {
  name        = "${local.csi}-misdb"
  description = "${local.csi}-misdb"
  family      = "oracle-se2-12.1"

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
    name         = "db_writer_processes"
    value        = "3"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "log_checkpoints_to_alert"
    value        = "TRUE"
    apply_method = "immediate"
  }

  parameter {
    name         = "recyclebin"
    value        = "ON"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "resource_limit"
    value        = "FALSE"
    apply_method = "immediate"
  }

  parameter {
    name         = "undo_tablespace"
    value        = "undo_t1"
    apply_method = "immediate"
  }

  parameter {
    name         = "undo_retention"
    value        = "7200"
    apply_method = "immediate"
  }
}

