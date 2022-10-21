# Create the TARS RSIS RDS DB
data "aws_ssm_parameter" "rsis_rds_password" {
  name = "/${var.environment}/rsisdb/admin/password"
}

resource "aws_db_instance" "rsisdb" {
  identifier                      = "${local.csi}-rsisdb"
  final_snapshot_identifier       = "${local.csi}-rsisdb-final"
  skip_final_snapshot             = var.rsis_rds_skip_final_snapshot
  allocated_storage               = var.rsis_rds_allocated_storage
  storage_type                    = var.rsis_rds_storage_type
  engine                          = var.rsis_rds_engine
  #engine_version                  = var.rsis_rds_engine_version
  instance_class                  = var.rsis_rds_instance_class
  username                        = var.rsis_rds_username
  password                        = data.aws_ssm_parameter.rsis_rds_password.value
  port                            = var.rsis_rds_port
  publicly_accessible             = var.rsis_rds_public
  multi_az                        = var.rsis_rds_multi_az
  backup_retention_period         = var.rsis_rds_backup_retention
  backup_window                   = var.rsis_rds_backup_window
  maintenance_window              = var.rsis_rds_maint_window
  apply_immediately               = var.rsis_rds_apply_immediately
  license_model                   = var.rsis_rds_license_model
  snapshot_identifier             = var.rsis_rds_snapshot
  parameter_group_name            = "${local.csi}-${var.rsis_rds_parameter_group_name}"
  option_group_name               = "tars-rsis-reporting-${var.environment}-${var.rsis_rds_option_group_name}"
  db_name                         = var.rsis_rds_sid_name
  deletion_protection             = var.risdb_rds_delete_protect
  enabled_cloudwatch_logs_exports = ["alert", "listener"]
  allow_major_version_upgrade     = var.rsis_allow_major_version_upgrade

  timeouts {
    update = "6h"
  }

  vpc_security_group_ids = [
    aws_security_group.tars-rsis-db.id,
  ]

  db_subnet_group_name = aws_db_subnet_group.misdb.id

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-rsisdb"
      "AutoScale" = var.rsis_rds_autoscale
    },
  )
}

