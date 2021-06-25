# resource labeled as a 'hardcoded' version to assist with upgrade.
resource "aws_db_parameter_group" "gitlab_pg_12" {

  name = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    replace(var.db_pg_family, ".", "")
  )

  description = "GitLab DB parameter group for ${var.db_pg_family}"
  family      = var.db_pg_family

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
