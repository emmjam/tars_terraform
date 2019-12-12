resource "aws_route" "private_nat_ctrl" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.terraform_remote_state.mgmt.outputs.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt.id
}

