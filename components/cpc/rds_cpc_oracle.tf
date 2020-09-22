# Create the CPC RDS DB
data "aws_ssm_parameter" "cpc_rds_password" {
  name = "/${var.environment}/cpcdb/admin/password"
}

resource "aws_db_instance" "cpcdb" {
  identifier                = "${local.csi}-cpcdb"
  final_snapshot_identifier = "${local.csi}-cpcdb-final"
  skip_final_snapshot       = var.cpc_rds_skip_final_snapshot
  allocated_storage         = var.cpc_rds_allocated_storage
  storage_type              = var.cpc_rds_storage_type
  engine                    = var.cpc_rds_engine
  engine_version            = var.cpc_rds_engine_version
  instance_class            = var.cpc_rds_instance_class
  username                  = var.cpc_rds_username
  password                  = data.aws_ssm_parameter.cpc_rds_password.value
  port                      = var.cpc_rds_port
  publicly_accessible       = var.cpc_rds_public
  multi_az                  = var.cpc_rds_multi_az
  backup_retention_period   = var.cpc_rds_backup_retention
  backup_window             = var.cpc_rds_backup_window
  maintenance_window        = var.cpc_rds_maint_window
  apply_immediately         = var.cpc_rds_apply_immediately
  license_model             = var.cpc_rds_license_model
  snapshot_identifier       = var.cpc_rds_snapshot
  parameter_group_name      = aws_db_parameter_group.cpc.id
  option_group_name         = aws_db_option_group.cpcdb.id
  name                      = var.cpc_rds_sid_name
  deletion_protection       = var.cpc_rds_delete_protect
  enabled_cloudwatch_logs_exports = ["alert", "listener"]

  vpc_security_group_ids = [
    aws_security_group.cpc-db.id,
  ]

  db_subnet_group_name = aws_db_subnet_group.cpcdb.id

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-cpcdb"
      "AutoScale" = var.cpc_rds_autoscale
    },
  )
}

