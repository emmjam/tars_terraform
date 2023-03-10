# Create the VPG for the DX Gateway

resource "aws_vpn_gateway" "dx_vpn_gw" {
  count  = var.dvsa_wan_connectivity_enabled ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/dx_vpg"
    },
  )
}

resource "aws_dx_gateway_association" "dx_vpn_gw_association" {
  count                 = var.dvsa_wan_connectivity_enabled ? 1 : 0
  dx_gateway_id         = data.terraform_remote_state.ctrl.outputs.dx_gateway_id[0]
  associated_gateway_id = aws_vpn_gateway.dx_vpn_gw[0].id
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "private_nonat_to_dx_gateway" {
  count          = var.dvsa_wan_connectivity_enabled ? 1 : 0
  vpn_gateway_id = aws_vpn_gateway.dx_vpn_gw[0].id
  route_table_id = aws_route_table.private_nonat.id
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "private_nat_to_dx_gateway" {
  count          = var.dvsa_wan_connectivity_enabled ? length(var.squidnat_subnets_cidrs) : 0
  vpn_gateway_id = aws_vpn_gateway.dx_vpn_gw[0].id
  route_table_id = element(aws_route_table.private_nat.*.id, count.index)
}

## Transit VPC

# Create the VPG for the Transit VPC
resource "aws_vpn_gateway" "vpn_gw" {
  count  = var.transit_peering_enabled ? 1 : 0
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.default_tags,
    {
      "Name"             = "${local.csi}/transit_vpg"
      "transitvpc:spoke" = "true"
    },
  )
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "private_nonat_to_transit_vpc" {
  count          = var.transit_peering_enabled ? 1 : 0
  vpn_gateway_id = aws_vpn_gateway.vpn_gw[0].id
  route_table_id = aws_route_table.private_nonat.id
}

# Enable route propagation
resource "aws_vpn_gateway_route_propagation" "private_nat_to_transit_vpc" {
  count          = var.transit_peering_enabled ? length(var.squidnat_subnets_cidrs) : 0
  vpn_gateway_id = aws_vpn_gateway.vpn_gw[0].id
  route_table_id = element(aws_route_table.private_nat.*.id, count.index)
}

