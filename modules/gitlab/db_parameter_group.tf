resource "aws_db_parameter_group" "gitlab" {

  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  description = "GitLab DB"
  family      = "postgres9.6" #var.db_pg_family - Hard coding to allow upgrade testing and clean upgrade path

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

resource "aws_db_parameter_group" "gitlab_pg_11" {

  name = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    replace(var.db_pg_family, ".", "")
  )

  description = "GitLab DB parameter group for ${var.db_pg_family}"
  family      = "postgres11" #var.db_pg_family - Hard coding to allow upgrade testing and clean upgrade path

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
