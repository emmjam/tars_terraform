resource "aws_db_instance" "database" {
  identifier = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name
  )}"

  vpc_security_group_ids = ["${aws_security_group.main.id}", "${var.additional_sg_ids}"]
  db_subnet_group_name   = "${aws_db_subnet_group.main.name}"
  parameter_group_name   = "${var.rds_db_pg_id}"
  option_group_name      = "${var.rds_db_og_id}"

  #  name                    = "${var.rds_db_name}"
  allocated_storage       = "${var.rds_allocated_storage}"
  storage_type            = "${var.rds_storage_type}"
  engine                  = "${var.rds_engine}"
  engine_version          = "${var.rds_engine_version}"
  instance_class          = "${var.rds_instance_class}"
  multi_az                = "${var.rds_multi_az}"
  username                = "${var.rds_username}"
  password                = "${var.rds_password}"
  backup_retention_period = "${var.rds_backup_retention_period}"
  backup_window           = "${var.rds_backup_window}"
  maintenance_window      = "${var.rds_maintenance_window}"
  skip_final_snapshot     = "${var.rds_skip_final_snapshot}"
  publicly_accessible     = "${var.public}"
  license_model           = "${var.license_model}"

  final_snapshot_identifier = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "final"
  )}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name
      ),
      "Module", var.module
    )
  )}"

#  provisioner "local-exec" {
#    command = "aws lambda invoke --invocation-type RequestResponse --function-name ${module.lambda_db_pw.name} --region eu-west-1 --log-type Tail --payload '' /dev/null"
#  }
}
