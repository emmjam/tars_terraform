resource "aws_lb" "jenkins" {
  name                             = "${var.project}-${var.environment}-${var.component}-${var.name}-nlb"
  load_balancer_type               = "network"
  internal                         = var.elb_internal
  enable_cross_zone_load_balancing = var.elb_cross_zone_load_balancing
  subnets                          = module.nlb_subnets.subnet_ids

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

