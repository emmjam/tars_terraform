# Create the CPC RDS DB for prod testing
resource "aws_db_instance" "test_target_cpcdb" {

  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "testcpctg"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "testcpctg",
    "final"
  )}"

  skip_final_snapshot     = "${var.test_target_cpc_rds_skip_final_snapshot}"
  allocated_storage       = "${var.test_target_cpc_rds_allocated_storage}"
  storage_type            = "${var.test_target_cpc_rds_storage_type}"
  engine                  = "${var.test_target_cpc_rds_engine}"
  engine_version          = "${var.test_target_cpc_rds_engine_version}"
  instance_class          = "${var.test_target_cpc_rds_instance_class}"
  username                = "${var.test_target_cpc_rds_username}"
  password                = "${var.test_target_cpc_rds_password}"
  port                    = "${var.test_target_cpc_rds_port}"
  publicly_accessible     = "${var.test_target_cpc_rds_public}"
  multi_az                = "${var.test_target_cpc_rds_multi_az}"
  backup_retention_period = "${var.test_target_cpc_rds_backup_retention}"
  backup_window           = "${var.test_target_cpc_rds_backup_window}"
  maintenance_window      = "${var.test_target_cpc_rds_maint_window}"
  apply_immediately       = "${var.test_target_cpc_rds_apply_immediately}"
  license_model           = "${var.test_target_cpc_rds_license_model}"
  name                    = "${var.test_target_cpc_rds_name}"
  parameter_group_name    = "${aws_db_parameter_group.dms_oem.id}"
  option_group_name       = "${aws_db_option_group.cpc_test.id}"
  
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
        "testcpctg"
      ),
      "Component", var.component,
      "AutoScale", var.target_dms_tars_rds_autoscale
    )
  )}"
}
