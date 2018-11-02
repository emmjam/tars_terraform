# Added by TS-4753
# To be removed by TS-4722 and TS-4756

# Create the TARS RSIS RDS DB
resource "aws_db_instance" "tmp_rsisdb" {

  count  = "${var.uat_dbs_in_prod == "true" ? 1 : 0}"

  identifier                = "${local.csi}-tmp-rsisdb"
  final_snapshot_identifier = "${local.csi}-tmp-rsisdb-final"
  skip_final_snapshot       = "${var.rsis_rds_skip_final_snapshot}"
  allocated_storage         = "${var.tmp_rsis_rds_allocated_storage}"
  storage_type              = "${var.rsis_rds_storage_type}"
  engine                    = "${var.rsis_rds_engine}"
  engine_version            = "${var.rsis_rds_engine_version}"
  instance_class            = "${var.rsis_rds_instance_class}"
  username                  = "${var.tmp_rsis_rds_username}"
  password                  = "${var.tmp_rsis_rds_password}"
  port                      = "${var.rsis_rds_port}"
  publicly_accessible       = "${var.rsis_rds_public}"
  multi_az                  = "${var.rsis_rds_multi_az}"
  backup_retention_period   = "${var.rsis_rds_backup_retention}"
  backup_window             = "${var.rsis_rds_backup_window}"
  maintenance_window        = "${var.rsis_rds_maint_window}"
  apply_immediately         = "${var.rsis_rds_apply_immediately}"
  license_model             = "${var.rsis_rds_license_model}"
  snapshot_identifier       = "${var.tmp_rsis_rds_snapshot}"
  parameter_group_name      = "${aws_db_parameter_group.rsis.id}"
  option_group_name         = "${aws_db_option_group.rsis.id}"
  name                      = "${var.rsis_rds_sid_name}"

  timeouts {
    update = "6h"
  }

  vpc_security_group_ids = [
    "${aws_security_group.tars-rsis-db.id}",
  ]

  db_subnet_group_name = "${aws_db_subnet_group.misdb.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name",      "${local.csi}-tmp-rsisdb",
      "AutoScale", var.rsis_rds_autoscale
    )
  )}"
}
