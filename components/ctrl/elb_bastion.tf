resource "aws_elb" "bastion" {
  name     = "${local.csi}-bastion"
  internal = "false"

  subnets = module.bastion_elb_subnets.subnet_ids

  security_groups = [
    aws_security_group.bastion_elb.id,
  ]

  cross_zone_load_balancing   = "true"
  idle_timeout                = "400"
  connection_draining         = "true"
  connection_draining_timeout = "400"

  listener {
    instance_port     = "22"
    instance_protocol = "tcp"
    lb_port           = "22"
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = "3"
    unhealthy_threshold = "2"
    timeout             = "10"
    target              = "TCP:22"
    interval            = "15"
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-bastion"
    },
  )
}

