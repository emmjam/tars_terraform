# ALB for public facing messaging for report pdf viewing
resource "aws_alb" "messaging-public-facing" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "msg",
    "public"
  )}"

  internal = "false"

  security_groups = ["${aws_security_group.tars-messaging-alb-public.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "public"
      ),
    )
  )}"
}
