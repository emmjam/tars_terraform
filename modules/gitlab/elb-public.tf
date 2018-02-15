resource "aws_elb" "gitlab_public" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "public",
  )}"

  internal                    = false
  connection_draining         = "${var.elb_connection_draining}"
  connection_draining_timeout = "${var.elb_connection_draining_timeout}"
  cross_zone_load_balancing   = "${var.elb_cross_zone_load_balancing}"
  security_groups             = ["${aws_security_group.elb.id}"]

  subnets = ["${module.elb_subnets.subnet_ids}"]

  listener {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  listener {
    instance_port      = 8888
    instance_protocol  = "HTTP"
    lb_port            = "${var.elb_public_port}"
    lb_protocol        = "${var.elb_public_protocol}"
    ssl_certificate_id = "${var.elb_public_ssl_certificate_id}"
  }

  health_check {
    healthy_threshold   = "${var.elb_healthy_threshold}"
    unhealthy_threshold = "${var.elb_unhealthy_threshold}"
    timeout             = "${var.elb_healthcheck_timeout}"
    target              = "TCP:8888"
    interval            = "${var.elb_healthcheck_interval}"
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
        "public",
      ),
      "Module", var.module
    )
  )}"
}
