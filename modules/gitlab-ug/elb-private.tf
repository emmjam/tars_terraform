resource "aws_elb" "gitlab_private" {
  name = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.name,
    "private",
  )

  internal                    = true
  connection_draining         = var.elb_connection_draining
  connection_draining_timeout = var.elb_connection_draining_timeout
  cross_zone_load_balancing   = var.elb_cross_zone_load_balancing
  security_groups             = [aws_security_group.elb_private.id]

  subnets = module.elb_private_subnets.subnet_ids

  listener {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  listener {
    instance_port      = 8888
    instance_protocol  = "HTTP"
    lb_port            = var.elb_public_port
    lb_protocol        = var.elb_public_protocol
    ssl_certificate_id = var.elb_public_ssl_certificate_id
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 10
    target              = "TCP:22"
    interval            = 15
  }

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s-%s",
        var.project,
        var.environment,
        var.component,
        var.name,
        "private",
      )
      "Module" = var.module
    },
  )
}

