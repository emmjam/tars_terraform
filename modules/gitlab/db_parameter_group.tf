resource "aws_db_parameter_group" "gitlab" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
  )}"

  description = "GitLab DB"
  family      = "${var.db_pg_family}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
      ),
      "Module", var.module
    )
  )}"
}
