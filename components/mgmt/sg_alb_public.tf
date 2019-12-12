resource "aws_security_group" "alb_public" {
  name        = "${local.csi}-alb-public"
  description = "Common SG for public ALB"
  vpc_id      = aws_vpc.mgmt.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-alb-public"
    },
  )
}

