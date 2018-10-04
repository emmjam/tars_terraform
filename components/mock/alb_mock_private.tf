# TARS Mock Private ALB
resource "aws_alb" "tars-alb-mock-private" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "mock-private"
  )}"

  internal = true

  security_groups = ["${aws_security_group.tars-alb-mock.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_tars_backend}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mock-private"
      ),
    )
  )}"
}
