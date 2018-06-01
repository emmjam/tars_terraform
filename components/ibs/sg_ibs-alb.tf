resource "aws_security_group" "ibs-alb" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs-alb"
  )}"

  description = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "ibs-alb"
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
        "ibs-alb"
      ),
      "Component", var.component
    )
  )}"
}
