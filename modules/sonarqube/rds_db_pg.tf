resource "aws_db_parameter_group" "sonarqube" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sonarqube",
  )

  description = "SonarQube DB"
  family      = var.rds_pg_family

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

