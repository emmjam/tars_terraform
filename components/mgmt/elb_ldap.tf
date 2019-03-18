# motldap ELB
resource "aws_elb" "ldap" {
  name     = "${local.csi}-ldap"

  internal = "true"

  subnets = [
    "${module.subnets_ldap_elb.subnet_ids}",
  ]

  security_groups = [
    "${aws_security_group.ldap_elb.id}",
  ]

  cross_zone_load_balancing   = "true"
  idle_timeout                = "400"
  connection_draining         = "true"
  connection_draining_timeout = "400"

  listener {
    instance_port      = "389"
    instance_protocol  = "tcp"
    lb_port            = "389"
    lb_protocol        = "tcp"
    ssl_certificate_id = ""
  }

  health_check {
    healthy_threshold   = "3"
    unhealthy_threshold = "2"
    timeout             = "3"
    target              = "TCP:389"
    interval            = "10"
  }

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-ldap"
    )
  )}"
}
