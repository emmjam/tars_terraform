# Update default SG to deny all traffic, any rules applied in console will get removed
resource "aws_default_security_group" "default" {
  vpc_id        = aws_vpc.mgmt.id
  
  ingress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }
  
  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/default"
    },
  )
}