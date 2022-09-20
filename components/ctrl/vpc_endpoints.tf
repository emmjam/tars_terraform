data "aws_vpc_endpoint_service" "logs" {

  service = "logs"
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.ctrl.id
  service_name      = data.aws_vpc_endpoint_service.logs.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoints_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "ecr_dkr" {

  service = "ecr.dkr"
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.ctrl.id
  service_name      = data.aws_vpc_endpoint_service.ecr_dkr.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoints_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "ecr_api" {

  service = "ecr.api"
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.ctrl.id
  service_name      = data.aws_vpc_endpoint_service.ecr_api.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoints_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "execute_api" {

  service = "execute-api"
}

resource "aws_vpc_endpoint" "execute_api" {
  count             = var.environment == "nonprod" ? 1 : 0

  vpc_id            = aws_vpc.ctrl.id
  service_name      = data.aws_vpc_endpoint_service.execute_api.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = tolist([aws_security_group.vpc_endpoints.id])
  subnet_ids          = module.vpc_endpoints_subnets.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}