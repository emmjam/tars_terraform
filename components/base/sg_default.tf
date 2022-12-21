# Update default SG to deny all traffic, any rules applied in console will get removed
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/default"
    },
  )
}