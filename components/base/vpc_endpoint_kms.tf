# TODO: peacheym: Replace with module_vpceif
# Create the KMS endpoint for the VPC
resource "aws_vpc_endpoint" "kms" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.eu-west-1.kms"
  vpc_endpoint_type = "Interface"

  security_group_ids = list(aws_security_group.kms_endpoint.id)

  subnet_ids = module.vpc_endpoint_subnets.subnet_ids

  private_dns_enabled = true
  tags                = local.default_tags
}

