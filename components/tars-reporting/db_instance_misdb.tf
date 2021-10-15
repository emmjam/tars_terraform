# Create the TARS MIS RDS DB
data "aws_ssm_parameter" "mis_rds_password" {
  name = "/${var.environment}/misdb/admin/password"
}

resource "aws_db_instance" "misdb" {
  identifier                = "${local.csi}-misdb"
  final_snapshot_identifier = "${local.csi}-misdb-final"
  skip_final_snapshot       = var.mis_rds_skip_final_snapshot
  allocated_storage         = var.mis_rds_allocated_storage
  storage_type              = var.mis_rds_storage_type
  engine                    = var.mis_rds_engine
  engine_version            = var.mis_rds_engine_version
  instance_class            = var.mis_rds_instance_class
  username                  = var.mis_rds_username
  password                  = data.aws_ssm_parameter.mis_rds_password.value
  port                      = var.mis_rds_port
  publicly_accessible       = var.mis_rds_public
  multi_az                  = var.mis_rds_multi_az
  backup_retention_period   = var.mis_rds_backup_retention
  backup_window             = var.mis_rds_backup_window
  maintenance_window        = var.mis_rds_maint_window
  apply_immediately         = var.mis_rds_apply_immediately
  license_model             = var.mis_rds_license_model
  snapshot_identifier       = var.mis_rds_snapshot
  //parameter_group_name      = aws_db_parameter_group.mis.id
  //option_group_name         = aws_db_option_group.mis.id
  parameter_group_name      = "${local.csi}-${var.mis_rds_parameter_group_name}"
  option_group_name         = "${local.csi}-${var.mis_rds_option_group_name}"
  name                      = var.mis_rds_sid_name
  deletion_protection       = var.misdb_rds_delete_protect
  enabled_cloudwatch_logs_exports = ["alert", "listener"]
  allow_major_version_upgrade = var.mis_allow_major_version_upgrade

  vpc_security_group_ids = [
    aws_security_group.tars-mis-db.id,
  ]

  db_subnet_group_name = aws_db_subnet_group.misdb.id

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-misdb"
      "AutoScale" = var.mis_rds_autoscale
    },
  )
}

