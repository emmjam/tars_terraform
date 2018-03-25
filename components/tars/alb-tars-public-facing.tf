# ALB for public facing tars
resource "aws_alb" "tars-public-facing" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tars-public"
  )}"

  internal = "false"

  security_groups = ["${aws_security_group.tars-alb-public.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-public"
      ),
    )
  )}"
}
