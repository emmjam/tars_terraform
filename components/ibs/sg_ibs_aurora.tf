resource "aws_security_group" "ibs_aurora" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs-db"
  )}"

  description = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs-db"
  )}"

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ibs"
      ),
      "Component", var.component
    )
  )}"
}
