resource "aws_elb" "gitlab_private" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "private",
  )}"

  internal                    = true
  connection_draining         = "${var.elb_connection_draining}"
  connection_draining_timeout = "${var.elb_connection_draining_timeout}"
  cross_zone_load_balancing   = "${var.elb_cross_zone_load_balancing}"
  security_groups             = ["${aws_security_group.elb_private.id}"]

  subnets = ["${module.elb_private_subnets.subnet_ids}"]

  listener {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 10
    target              = "TCP:22"
    interval            = 15
  }

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "private",
      ),
      "Module", var.module
    )
  )}"
}
