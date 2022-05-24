resource "aws_security_group" "reporting_xe_alb" {
  count       = var.reporting_xe_count
  vpc_id      = aws_vpc.vpc.id
  description = "${local.csi}-reporting-xe-alb"
  name        = "${local.csi}-reporting-xe-alb"

  tags = merge(
    local.default_tags,
    { "Name" = "${local.csi}/reporting-alb" },
  )
}
