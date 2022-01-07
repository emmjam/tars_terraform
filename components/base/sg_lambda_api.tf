resource "aws_security_group" "api_lambda_sg" {
  name        = "${local.csi}/api-lambda-sg"
  description = "TARS API Lambda SG [${upper(local.csi)}] security group"
  vpc_id      = aws_vpc.vpc.id 

 tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/lambda-api-sg"
    },
  )
}

