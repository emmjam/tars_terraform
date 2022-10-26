# Create the TARS RDS DB
data "aws_ssm_parameter" "tars_rds_password" {
  name = "/${var.environment}/tarsdb/admin/password"
}

resource "aws_db_instance" "tarsdb" {
  identifier                      = "${local.csi}-tarsdb"
  final_snapshot_identifier       = "${local.csi}-tarsdb-final"
  skip_final_snapshot             = var.tars_rds_skip_final_snapshot
  allocated_storage               = var.tars_rds_allocated_storage
  storage_type                    = var.tars_rds_storage_type
  engine                          = var.tars_rds_engine
  engine_version                  = var.tars_rds_engine_version
  allow_major_version_upgrade     = var.tars_rds_allow_major_engine_version_upgrade
  instance_class                  = var.tars_rds_instance_class
  username                        = var.tars_rds_username
  password                        = data.aws_ssm_parameter.tars_rds_password.value
  port                            = var.tars_rds_port
  publicly_accessible             = var.tars_rds_public
  multi_az                        = var.tars_rds_multi_az
  backup_retention_period         = var.tars_rds_backup_retention
  backup_window                   = var.tars_rds_backup_window
  maintenance_window              = var.tars_rds_maint_window
  apply_immediately               = var.tars_rds_apply_immediately
  license_model                   = var.tars_rds_license_model
  snapshot_identifier             = var.tars_rds_snapshot
  parameter_group_name            = "${local.csi}-${var.tars_rds_parameter_group_name}"
  option_group_name               = "${local.csi}-${var.tars_rds_option_group_name}"
  db_name                         = var.tars_rds_sid_name
  deletion_protection             = var.tars_rds_delete_protect
  enabled_cloudwatch_logs_exports = ["alert", "listener"]

  vpc_security_group_ids = [
    aws_security_group.tars-core-db.id,
  ]

  db_subnet_group_name = aws_db_subnet_group.tarsdb.id

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-tarsdb"
      "AutoScale" = var.tars_rds_autoscale
    },
  )
}

