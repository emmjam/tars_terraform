# Create the TARS MIS RDS DB
resource "aws_db_instance" "misdb" {

  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "misdb"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "misdb",
    "final"
  )}"

  skip_final_snapshot     = "${var.mis_rds_skip_final_snapshot}"
  allocated_storage       = "${var.mis_rds_allocated_storage}"
  storage_type            = "${var.mis_rds_storage_type}"
  engine                  = "${var.mis_rds_engine}"
  engine_version          = "${var.mis_rds_engine_version}"
  instance_class          = "${var.mis_rds_instance_class}"
  username                = "${var.mis_rds_username}"
  password                = "${var.mis_rds_password}"
  port                    = "${var.mis_rds_port}"
  publicly_accessible     = "${var.mis_rds_public}"
  multi_az                = "${var.mis_rds_multi_az}"
  backup_retention_period = "${var.mis_rds_backup_retention}"
  backup_window           = "${var.mis_rds_backup_window}"
  maintenance_window      = "${var.mis_rds_maint_window}"
  apply_immediately       = "${var.mis_rds_apply_immediately}"
  license_model           = "${var.mis_rds_license_model}"
  snapshot_identifier     = "${var.mis_rds_snapshot}"
  parameter_group_name    = "${aws_db_parameter_group.mis.id}"
  option_group_name       = "${aws_db_option_group.mis.id}"
  name                    = "${var.mis_rds_sid_name}"

  vpc_security_group_ids = [
    "${aws_security_group.tars-mis-db.id}",
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
        "misdb"
      ),
      "Component", var.component,
      "AutoScale", var.mis_rds_autoscale
    )
  )}"
}
