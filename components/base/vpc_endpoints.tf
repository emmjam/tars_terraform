data "aws_vpc_endpoint_service" "logs" {

  service = "logs"
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.logs.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = list(aws_security_group.vpc_endpoints.id)
  subnet_ids          = module.tars_alb_internal.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "ecr_dkr" {

  service = "ecr.dkr"
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.ecr_dkr.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = list(aws_security_group.vpc_endpoints.id)
  subnet_ids          = module.tars_alb_internal.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "ecr_api" {

  service = "ecr.api"
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.ecr_api.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = list(aws_security_group.vpc_endpoints.id)
  subnet_ids          = module.tars_alb_internal.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.ssm.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  subnet_ids          = module.tars_alb_internal.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "ssm" {
  service = "ssm"
}

resource "aws_vpc_endpoint" "monitoring" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = data.aws_vpc_endpoint_service.monitoring.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  subnet_ids          = module.tars_alb_internal.subnet_ids
  private_dns_enabled = "true"
  tags                = local.default_tags
}

data "aws_vpc_endpoint_service" "monitoring" {
  service = "monitoring"
}
