resource "aws_security_group" "prometheus-alb-private" {
  name        = "${local.csi}/prometheus-alb-private"
  description = "Prometheus ALB Private"
  vpc_id      = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/prometheus-alb-private"
    },
  )
}

