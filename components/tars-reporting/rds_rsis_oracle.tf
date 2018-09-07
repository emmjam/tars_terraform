# Create the TARS RSIS RDS DB
resource "aws_db_instance" "rsisdb" {

  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "rsisdb"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "rsisdb",
    "final"
  )}"

  skip_final_snapshot     = "${var.rsis_rds_skip_final_snapshot}"
  allocated_storage       = "${var.rsis_rds_allocated_storage}"
  storage_type            = "${var.rsis_rds_storage_type}"
  engine                  = "${var.rsis_rds_engine}"
  engine_version          = "${var.rsis_rds_engine_version}"
  instance_class          = "${var.rsis_rds_instance_class}"
  username                = "${var.rsis_rds_username}"
  password                = "${var.rsis_rds_password}"
  port                    = "${var.rsis_rds_port}"
  publicly_accessible     = "${var.rsis_rds_public}"
  multi_az                = "${var.rsis_rds_multi_az}"
  backup_retention_period = "${var.rsis_rds_backup_retention}"
  backup_window           = "${var.rsis_rds_backup_window}"
  maintenance_window      = "${var.rsis_rds_maint_window}"
  parameter_group_name    = "${aws_db_parameter_group.rsisdb.id}"
  apply_immediately       = "${var.rsis_rds_apply_immediately}"
  license_model           = "${var.rsis_rds_license_model}"
  snapshot_identifier     = "${var.rsis_rds_snapshot}"
  option_group_name       = "${aws_db_option_group.tars_rsis_timezone.id}"
  timeouts {
    update = "6h"
  }

  vpc_security_group_ids = [
    "${aws_security_group.tars-rsis-db.id}",
  ]

  db_subnet_group_name = "${aws_db_subnet_group.misdb.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        "rsisdb"
      ),
      "Component", var.component,
      "AutoScale", var.rsis_rds_autoscale
    )
  )}"
}
