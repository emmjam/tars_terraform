resource "aws_security_group" "prometheus-efs" {
  name        = "${local.csi}/prometheus-efs"
  description = "Prometheus EFS"
  vpc_id      = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/prometheus-efs"
    },
  )
}

