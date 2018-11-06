# Added by TS-4753
# To be removed by TS-4722 and TS-4756

# Create the CPC RDS DB
resource "aws_db_instance" "tmp_cpcdb" {
  count  = "${var.uat_dbs_in_prod == "true" ? 1 : 0}"
  
  identifier                = "${local.csi}-tmp-cpcdb"
  final_snapshot_identifier = "${local.csi}-tmp-cpcdb-final"
  skip_final_snapshot       = "${var.cpc_rds_skip_final_snapshot}"
  allocated_storage         = "${var.tmp_cpc_rds_allocated_storage}"
  storage_type              = "${var.cpc_rds_storage_type}"
  engine                    = "${var.cpc_rds_engine}"
  engine_version            = "${var.cpc_rds_engine_version}"
  instance_class            = "${var.cpc_rds_instance_class}"
  username                  = "${var.tmp_cpc_rds_username}"
  password                  = "${var.tmp_cpc_rds_password}"
  port                      = "${var.cpc_rds_port}"
  publicly_accessible       = "${var.cpc_rds_public}"
  multi_az                  = "${var.cpc_rds_multi_az}"
  backup_retention_period   = "${var.cpc_rds_backup_retention}"
  backup_window             = "${var.cpc_rds_backup_window}"
  maintenance_window        = "${var.cpc_rds_maint_window}"
  apply_immediately         = "${var.cpc_rds_apply_immediately}"
  license_model             = "${var.cpc_rds_license_model}"
  snapshot_identifier       = "${var.tmp_cpc_rds_snapshot}"
  parameter_group_name      = "${aws_db_parameter_group.cpc.id}"
  option_group_name         = "${aws_db_option_group.cpcdb.id}"
  name                      = "${var.cpc_rds_sid_name}"

  vpc_security_group_ids = [
    "${aws_security_group.cpc-db.id}",
  ]

  db_subnet_group_name = "${aws_db_subnet_group.cpcdb.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-tmp-cpcdb",
      "AutoScale", var.cpc_rds_autoscale
    )
  )}"
}
