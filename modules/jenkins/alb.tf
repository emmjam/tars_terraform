resource "aws_alb" "jenkins" {
  name                             = "${var.project}-${var.environment}-${var.component}-${var.name}"
  internal                         = var.alb_internal
  idle_timeout                     = var.alb_idle_timeout
  enable_cross_zone_load_balancing = var.alb_cross_zone_load_balancing
  security_groups                  = [aws_security_group.alb.id]
  subnets                          = module.elb_subnets.subnet_ids

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

