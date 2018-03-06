resource "aws_db_instance" "tarsdb" {
  #identifier = "${var.environment}-${var.project}-tars-rds-instance"

  # TODO: Change this to:
  # NB - will affect other environments so don't change yet!
  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tarsdb"
  )}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tarsdb",
    "final"
  )}"

  skip_final_snapshot     = "${var.tars_rds_skip_final_snapshot}"
  allocated_storage       = "${var.tars_rds_allocated_storage}"
  storage_type            = "${var.tars_rds_storage_type}"
  engine                  = "${var.tars_rds_engine}"
  engine_version          = "${var.tars_rds_engine_version}"
  instance_class          = "${var.tars_rds_instance_class}"
  username                = "${var.tars_rds_username}"
  password                = "${var.tars_rds_password}"
  port                    = "${var.tars_rds_port}"
  publicly_accessible     = "${var.tars_rds_public}"
  multi_az                = "${var.tars_rds_multi_az}"
  backup_retention_period = "${var.tars_rds_backup_retention}"
  backup_window           = "${var.tars_rds_backup_window}"
  maintenance_window      = "${var.tars_rds_maint_window}"
  parameter_group_name    = "${aws_db_parameter_group.tarsdb.id}"
  apply_immediately       = "${var.tars_rds_apply_immediately}"
  license_model           = "${var.tars_rds_license_model}"
  snapshot_identifier     = "${var.tars_rds_snapshot}"

  vpc_security_group_ids = [
    "${aws_security_group.tars-core-db.id}",
  ]

  db_subnet_group_name = "${aws_db_subnet_group.tarsdb.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        "tarsdb"
      ),
      "Component", var.component
    )
  )}"
}

# resource "aws_db_instance" "motdb_replica" {
#   identifier = "${format(
#         "%s-%s-%s-%s",
#         var.project,
#         var.environment,
#         var.component,
#         "motdb-replica"
#         )}"

#   count               = "${var.motdb_readrep_count}"
#   replicate_source_db = "${aws_db_instance.motdb.id}"

#   instance_class      = "${var.main_rds_instance_class}"
#   skip_final_snapshot = "${var.main_rds_skip_final_snapshot}"

#   tags = "${merge(
#     var.default_tags,
#     map(
#       "Name", format(
#         "%s-%s-%s-%s",
#         var.project,
#         var.environment,
#         var.component,
#         "motdb-replica"
#       ),
#       "Component", var.component
#     )
#   )}"
# }
