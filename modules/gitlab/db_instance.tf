resource "aws_db_instance" "gitlab" {
  identifier = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.gitlab.name
  parameter_group_name   = aws_db_parameter_group.gitlab_pg_12.name 

  allocated_storage       = var.db_allocated_storage
  storage_type            = var.db_storage_type
  engine                  = "postgres"
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  port                    = 5432
  multi_az                = var.db_multi_az
  username                = var.db_username
  password                = var.db_password
  backup_retention_period = var.db_backup_retention_period
  backup_window           = var.db_backup_window
  maintenance_window      = var.db_maintenance_window
  skip_final_snapshot     = var.db_skip_final_snapshot
  snapshot_identifier     = var.db_snapshot_id
  lifecycle {
#    ignore_changes = ["snapshot_identifier"]
  }

  final_snapshot_identifier = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
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
        var.name,
      )
      "Module" = var.module
    },
  )
}

