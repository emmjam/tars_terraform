resource "aws_security_group" "sonarqube_db" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sonarqube-db",
  )

  description = "SonarQube DB"
  vpc_id      = var.vpc_id

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "sonarqube-db",
      )
      "Module" = var.module
    },
  )
}

