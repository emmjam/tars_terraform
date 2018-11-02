# Added by TS-4753
# To be removed by TS-4722 and TS-4756

# Create the TARS MIS RDS DB
resource "aws_db_instance" "tmp_misdb" {

  count  = "${var.uat_dbs_in_prod == "true" ? 1 : 0}"

  identifier                = "${local.csi}-tmp-misdb"
  final_snapshot_identifier = "${local.csi}-tmp-misdb-final" 
  skip_final_snapshot       = "${var.mis_rds_skip_final_snapshot}"
  allocated_storage         = "${var.tmp_mis_rds_allocated_storage}"
  storage_type              = "${var.mis_rds_storage_type}"
  engine                    = "${var.mis_rds_engine}"
  engine_version            = "${var.mis_rds_engine_version}"
  instance_class            = "${var.mis_rds_instance_class}"
  username                  = "${var.tmp_mis_rds_username}"
  password                  = "${var.tmp_mis_rds_password}"
  port                      = "${var.mis_rds_port}"
  publicly_accessible       = "${var.mis_rds_public}"
  multi_az                  = "${var.mis_rds_multi_az}"
  backup_retention_period   = "${var.mis_rds_backup_retention}"
  backup_window             = "${var.mis_rds_backup_window}"
  maintenance_window        = "${var.mis_rds_maint_window}"
  apply_immediately         = "${var.mis_rds_apply_immediately}"
  license_model             = "${var.mis_rds_license_model}"
  snapshot_identifier       = "${var.tmp_mis_rds_snapshot}"
  parameter_group_name      = "${aws_db_parameter_group.mis.id}"
  option_group_name         = "${aws_db_option_group.mis.id}"
  name                      = "${var.mis_rds_sid_name}"

  vpc_security_group_ids = [
    "${aws_security_group.tars-mis-db.id}",
  ]

  db_subnet_group_name = "${aws_db_subnet_group.misdb.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name",      "${local.csi}-tmp-misdb",
      "AutoScale", var.mis_rds_autoscale
    )
  )}"
}
