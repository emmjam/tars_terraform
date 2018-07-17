# TARS Mock Public ALB
resource "aws_alb" "tars-alb-mock-public" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "mock-public"
  )}"

  internal = false

  security_groups = ["${aws_security_group.tars-alb-mock-public.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mock-public"
      ),
    )
  )}"
}
