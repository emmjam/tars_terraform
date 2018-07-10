# Create the CPC RDS DB
resource "aws_db_instance" "cpcdb" {

  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpcdb"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpcdb",
    "final"
  )}"

  skip_final_snapshot     = "${var.cpc_rds_skip_final_snapshot}"
  allocated_storage       = "${var.cpc_rds_allocated_storage}"
  storage_type            = "${var.cpc_rds_storage_type}"
  engine                  = "${var.cpc_rds_engine}"
  engine_version          = "${var.cpc_rds_engine_version}"
  instance_class          = "${var.cpc_rds_instance_class}"
  username                = "${var.cpc_rds_username}"
  password                = "${var.cpc_rds_password}"
  port                    = "${var.cpc_rds_port}"
  publicly_accessible     = "${var.cpc_rds_public}"
  multi_az                = "${var.cpc_rds_multi_az}"
  backup_retention_period = "${var.cpc_rds_backup_retention}"
  backup_window           = "${var.cpc_rds_backup_window}"
  maintenance_window      = "${var.cpc_rds_maint_window}"
  parameter_group_name    = "${var.project}-${var.component}-${var.environment}-${replace(var.cpc_rds_instance_class, ".", "-")}"
  apply_immediately       = "${var.cpc_rds_apply_immediately}"
  license_model           = "${var.cpc_rds_license_model}"
  snapshot_identifier     = "${var.cpc_rds_snapshot}"

  vpc_security_group_ids = [
    "${aws_security_group.cpc-db.id}",
  ]

  db_subnet_group_name = "${aws_db_subnet_group.cpcdb.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        "cpcdb"
      ),
      "Component", var.component,
      "AutoScale", var.cpc_rds_autoscale
    )
  )}"
}
