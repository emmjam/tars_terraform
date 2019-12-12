# SG for the AWS MQ Service
resource "aws_security_group" "tars-awsmq" {
  name        = "${local.csi}-awsmq"
  description = "TARS AWS MQ"
  vpc_id      = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/awsmq"
    },
  )
}

