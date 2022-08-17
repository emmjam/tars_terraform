resource "aws_route53_resolver_endpoint" "r53_resolver_endpoint_in" {
  count     = var.account_environment == "mgmt" ? 1 : 0
  name      = "r53_resolver_endpoint_in"
  direction = "INBOUND"

  security_group_ids = [
    aws_security_group.r53_endpoint.id
  ]

# natgw_subnets_cidr = "10.200.1.48/28", "10.200.1.64/28", "10.200.1.80/28"
  ip_address {
    # AZ: eu-west-1a
    subnet_id      = module.natgw_subnets.subnet_ids[0]
    ip             = var.mgmt_dns_endpoint_ips[0]
  }

  ip_address {
    # AZ: eu-west-1b
    subnet_id      = module.natgw_subnets.subnet_ids[1]
    ip             = var.mgmt_dns_endpoint_ips[1]
  }

  ip_address {
    # AZ: eu-west-1c
    subnet_id      = module.natgw_subnets.subnet_ids[2]
    ip             = var.mgmt_dns_endpoint_ips[2]
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/r53_resolver_endpoint_in"
    },
  )
}


resource "aws_route53_resolver_endpoint" "r53_resolver_endpoint_out" {
  count     = var.account_environment == "mgmt" ? 1 : 0
  name      = "r53_resolver_endpoint_out"
  direction = "OUTBOUND"

  security_group_ids = [
    aws_security_group.r53_endpoint.id
  ]

# natgw_subnets_cidr = "10.200.1.48/28", "10.200.1.64/28", "10.200.1.80/28"
  ip_address {
    # AZ: eu-west-1a
    subnet_id      = module.natgw_subnets.subnet_ids[0]
    ip             = var.mgmt_dns_endpoint_ips[0]
  }

  ip_address {
    # AZ: eu-west-1b
    subnet_id      = module.natgw_subnets.subnet_ids[1]
    ip             = var.mgmt_dns_endpoint_ips[1]
  }

  ip_address {
    # AZ: eu-west-1c
    subnet_id      = module.natgw_subnets.subnet_ids[2]
    ip             = var.mgmt_dns_endpoint_ips[2]
  }

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/r53_resolver_endpoint_out"
    },
  )
}