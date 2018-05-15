# This is to allow RDP in a private node

resource "aws_elb" "messaging_public" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    "msg",
    "rdp-public"
  )}"

  internal                    = false
  connection_draining         = true
  connection_draining_timeout = 400
  cross_zone_load_balancing   = true
  security_groups             = ["${aws_security_group.tars-messaging-alb-public.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  listener {
    instance_port     = 3389
    instance_protocol = "TCP"
    lb_port           = 3389
    lb_protocol       = "TCP"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:3389"
    interval            = 30
  }

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "rdp-public"
      ),
    )
  )}"
}
