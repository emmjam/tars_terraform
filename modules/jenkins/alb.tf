resource "aws_alb" "jenkins" {
  name                             = "${var.project}-${var.environment}-${var.component}-${var.name}-alb"
  internal                         = var.elb_internal
  idle_timeout                     = var.elb_idle_timeout
  enable_cross_zone_load_balancing = var.elb_cross_zone_load_balancing
  security_groups                  = [aws_security_group.elb.id]
  subnets                          = module.alb_subnets.subnet_ids

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        var.name,
      )
      "Module" = var.module
    },
  )
}

