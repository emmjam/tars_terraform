resource "aws_db_instance" "sonarqube" {
  identifier = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sonarqube",
  )

  vpc_security_group_ids = [aws_security_group.sonarqube_db.id]
  db_subnet_group_name   = aws_db_subnet_group.sonarqube.name
  parameter_group_name   = aws_db_parameter_group.sonarqube.name

  name                    = var.rds_db_name
  allocated_storage       = var.rds_allocated_storage
  storage_type            = var.rds_storage_type
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class
  multi_az                = var.rds_multi_az
  username                = var.rds_username
  password                = var.rds_password
  backup_retention_period = var.rds_backup_retention_period
  backup_window           = var.rds_backup_window
  maintenance_window      = var.rds_maintenance_window
  skip_final_snapshot     = var.rds_skip_final_snapshot

  final_snapshot_identifier = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sonarqube",
    "final",
  )

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "sonarqube",
      )
      "Module" = var.module
    },
  )
}

