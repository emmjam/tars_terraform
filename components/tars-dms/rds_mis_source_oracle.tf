# Create the mis RDS DB for DMS
resource "aws_db_instance" "source_misdb_dms" {

  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "misdmssc"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "misdmssc",
    "final"
  )}"

  skip_final_snapshot     = "${var.source_dms_mis_rds_skip_final_snapshot}"
  allocated_storage       = "${var.source_dms_mis_rds_allocated_storage}"
  storage_type            = "${var.source_dms_mis_rds_storage_type}"
  engine                  = "${var.source_dms_mis_rds_engine}"
  engine_version          = "${var.source_dms_mis_rds_engine_version}"
  instance_class          = "${var.source_dms_mis_rds_instance_class}"
  username                = "${var.source_dms_mis_rds_username}"
  password                = "${var.source_dms_mis_rds_password}"
  port                    = "${var.source_dms_mis_rds_port}"
  publicly_accessible     = "${var.source_dms_mis_rds_public}"
  multi_az                = "${var.source_dms_mis_rds_multi_az}"
  backup_retention_period = "${var.source_dms_mis_rds_backup_retention}"
  backup_window           = "${var.source_dms_mis_rds_backup_window}"
  maintenance_window      = "${var.source_dms_mis_rds_maint_window}"
  apply_immediately       = "${var.source_dms_mis_rds_apply_immediately}"
  license_model           = "${var.source_dms_mis_rds_license_model}"
  name                    = "${var.source_dms_mis_rds_name}"
  snapshot_identifier     = "${var.source_dms_mis_rds_snapshot}"
  parameter_group_name    = "${aws_db_parameter_group.dms_oem.id}"
  option_group_name       = "${aws_db_option_group.dms_oem.id}"

  
  vpc_security_group_ids = [
    "${aws_security_group.tars-dms.id}","${aws_security_group.dms-oem.id}"
  ]

  db_subnet_group_name = "${aws_db_subnet_group.tarsdb_dms.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        "misdmssc"
      ),
      "Component", var.component,
      "AutoScale", var.source_dms_mis_rds_autoscale
    )
  )}"
}
