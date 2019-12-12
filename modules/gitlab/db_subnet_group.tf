resource "aws_db_subnet_group" "gitlab" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )

  description = "GitLab DB"
  subnet_ids = module.db_subnets.subnet_ids

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

