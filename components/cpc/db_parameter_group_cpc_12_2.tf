################################################################################
#
# RDS Parameter Groups
#
################################################################################

resource "aws_db_parameter_group" "cpc-12-2" {
  name        = "${local.csi}-cpcdb-12-2"
  description = "${local.csi}-cpcdb-12-2"

  family = "oracle-se2-12.2"

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
    name         = "db_keep_cache_size"
    value        = "167772160"
    apply_method = "immediate"
  }

  parameter {
    name         = "db_writer_processes"
    value        = "2"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "job_queue_processes"
    value        = "100"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_checkpoint_interval"
    value        = "10000"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_checkpoints_to_alert"
    value        = "TRUE"
    apply_method = "immediate"
  }

  parameter {
    name         = "open_cursors"
    value        = "1000"
    apply_method = "immediate"
  }

  parameter {
    name         = "optimizer_index_caching"
    value        = "90"
    apply_method = "immediate"
  }

  parameter {
    name         = "optimizer_index_cost_adj"
    value        = "1"
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
    name         = "session_cached_cursors"
    value        = "75"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "undo_retention"
    value        = "14400"
    apply_method = "immediate"
  }
  
  # after updating to TF1.2 and aws provider 4.36.0 this resource is always showing as needing a change in a plans even after applies
  # this parameter group will not change as 19c is currently in use but is needed for snapshots so adding a ignore changes lifecycle rule
  lifecycle {
    ignore_changes = [parameter]
  }
}

