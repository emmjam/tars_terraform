# Create the TARS MIS RDS DB
data "aws_ssm_parameter" "mis_rds_password" {
  name = "/${var.environment}/misdb/admin/password"
}

resource "aws_db_instance" "misdb" {
  identifier     = "${local.csi}-misdb"
  instance_class = var.mis_rds_instance_class
  license_model  = var.mis_rds_license_model

  name     = var.mis_rds_sid_name
  username = var.mis_rds_username
  password = data.aws_ssm_parameter.mis_rds_password.value
  port     = var.mis_rds_port

  engine                      = var.mis_rds_engine
  engine_version              = var.mis_rds_engine_version
  allow_major_version_upgrade = var.mis_allow_major_version_upgrade

  snapshot_identifier       = var.mis_rds_snapshot
  final_snapshot_identifier = "${local.csi}-misdb-final"
  skip_final_snapshot       = var.mis_rds_skip_final_snapshot

  allocated_storage = var.mis_rds_allocated_storage
  storage_type      = var.mis_rds_storage_type

  backup_retention_period = var.mis_rds_backup_retention
  backup_window           = var.mis_rds_backup_window
  maintenance_window      = var.mis_rds_maint_window
  apply_immediately       = var.mis_rds_apply_immediately

  deletion_protection             = var.misdb_rds_delete_protect
  enabled_cloudwatch_logs_exports = ["alert", "listener"]

  parameter_group_name = "${local.csi}-${var.mis_rds_parameter_group_name}"
  option_group_name    = "tars-mis-reporting-${var.environment}-${var.mis_rds_option_group_name}"

  publicly_accessible    = var.mis_rds_public
  multi_az               = var.mis_rds_multi_az
  vpc_security_group_ids = [aws_security_group.tars-mis-db.id, ]
  db_subnet_group_name   = aws_db_subnet_group.misdb.id

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-misdb"
      "AutoScale" = var.mis_rds_autoscale
    },
  )
}

resource "aws_db_instance" "misdb_encrypted" {
  identifier     = "${local.csi}-misdb-encrypted"
  instance_class = var.mis_rds_instance_class
  license_model  = var.mis_rds_license_model

  name     = var.mis_rds_sid_name
  username = var.mis_rds_username
  password = data.aws_ssm_parameter.mis_rds_password.value
  port     = var.mis_rds_port

  engine                      = var.mis_rds_engine
  engine_version              = var.mis_rds_engine_version
  allow_major_version_upgrade = var.mis_allow_major_version_upgrade

  snapshot_identifier       = var.mis_rds_encrypted_snapshot
  final_snapshot_identifier = "${local.csi}-misdb-encrypted-final"
  skip_final_snapshot       = var.mis_rds_skip_final_snapshot

  allocated_storage = var.mis_rds_allocated_storage
  storage_type      = var.mis_rds_storage_type
  storage_encrypted = var.mis_rds_storage_encrypted
  kms_key_id        = data.aws_kms_key.env_by_alias.arn

  backup_retention_period = var.mis_rds_backup_retention
  backup_window           = var.mis_rds_backup_window
  maintenance_window      = var.mis_rds_maint_window
  apply_immediately       = var.mis_rds_apply_immediately

  deletion_protection             = var.misdb_rds_delete_protect
  enabled_cloudwatch_logs_exports = ["alert", "listener"]

  parameter_group_name = "${local.csi}-${var.mis_rds_parameter_group_name}"
  option_group_name    = "tars-mis-reporting-${var.environment}-${var.mis_rds_option_group_name}"

  publicly_accessible    = var.mis_rds_public
  multi_az               = var.mis_rds_multi_az
  vpc_security_group_ids = [aws_security_group.tars-mis-db.id, ]
  db_subnet_group_name   = aws_db_subnet_group.misdb.id

  tags = merge(
    local.default_tags,
    {
      "Name"      = "${local.csi}-misdb"
      "AutoScale" = var.mis_rds_autoscale
    },
  )
}