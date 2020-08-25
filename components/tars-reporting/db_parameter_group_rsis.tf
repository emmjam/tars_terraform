################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "rsis" {
  name        = "${local.csi}-rsisdb"
  description = "${local.csi}-rsisdb"
  family      = "oracle-se2-12.1"

  parameter {
    name         = "audit_trail"
    value        = "DB"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "db_16k_cache_size"
    value        = "318767104"
    apply_method = "immediate"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "100"
    apply_method = "immediate"
  }

  parameter {
    name         = "optimizer_index_caching"
    value        = "90"
    apply_method = "immediate"
  }

  parameter {
    name         = "optimizer_index_cost_adj"
    value        = "10"
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

  parameter {
    name         = "undo_retention"
    value        = "7800"
    apply_method = "immediate"
  }

  parameter {
    name         = "sql92_security"
    value        = "TRUE"
    apply_method = "pending-reboot"
  }
}

