# Create the CPC RDS DB for DMS
resource "aws_db_instance" "target_cpcdb_dms" {

  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpcdmstg"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cpcdmstg",
    "final"
  )}"

  skip_final_snapshot     = "${var.target_dms_cpc_rds_skip_final_snapshot}"
  allocated_storage       = "${var.target_dms_cpc_rds_allocated_storage}"
  storage_type            = "${var.target_dms_cpc_rds_storage_type}"
  engine                  = "${var.target_dms_cpc_rds_engine}"
  engine_version          = "${var.target_dms_cpc_rds_engine_version}"
  instance_class          = "${var.target_dms_cpc_rds_instance_class}"
  username                = "${var.target_dms_cpc_rds_username}"
  password                = "${var.target_dms_cpc_rds_password}"
  port                    = "${var.target_dms_cpc_rds_port}"
  publicly_accessible     = "${var.target_dms_cpc_rds_public}"
  multi_az                = "${var.target_dms_cpc_rds_multi_az}"
  backup_retention_period = "${var.target_dms_cpc_rds_backup_retention}"
  backup_window           = "${var.target_dms_cpc_rds_backup_window}"
  maintenance_window      = "${var.target_dms_cpc_rds_maint_window}"
  apply_immediately       = "${var.target_dms_cpc_rds_apply_immediately}"
  license_model           = "${var.target_dms_cpc_rds_license_model}"
  name                    = "${var.target_dms_cpc_rds_name}"
  snapshot_identifier     = "${var.target_dms_cpc_rds_snapshot}"
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
        "cpcdmstg"
      ),
      "Component", var.component,
      "AutoScale", var.target_dms_cpc_rds_autoscale
    )
  )}"
}
