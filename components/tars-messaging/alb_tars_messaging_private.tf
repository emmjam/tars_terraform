# ALB for TARS messaging
resource "aws_alb" "tars-alb-messaging-private" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "tars",
    "msg"
  )}"

  internal = true

  security_groups = ["${aws_security_group.tars-alb-messaging.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_tars_messaging_alb}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "messaging-private"
      ),
    )
  )}"
}
