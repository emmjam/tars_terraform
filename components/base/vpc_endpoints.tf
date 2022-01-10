#VPC Endpoints

#logs
data "aws_vpc_endpoint_service" "logs" {
  service = "logs"
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.logs.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoint_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

#ecr
data "aws_vpc_endpoint_service" "ecr_dkr" {
  service = "ecr.dkr"
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.ecr_dkr.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoint_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

#ecr_api
data "aws_vpc_endpoint_service" "ecr_api" {
  service = "ecr.api"
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.ecr_api.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoint_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

#ssm
data "aws_vpc_endpoint_service" "ssm" {
  service = "ssm"
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.ssm.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  subnet_ids          = module.vpc_endpoint_subnets.subnet_ids
  private_dns_enabled = "false"
  tags                = local.default_tags
}

#monitoring
data "aws_vpc_endpoint_service" "monitoring" {
  service = "monitoring"
}

resource "aws_vpc_endpoint" "monitoring" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.monitoring.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  subnet_ids          = module.vpc_endpoint_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}
