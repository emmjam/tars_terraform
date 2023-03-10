data "aws_vpc_peering_connection" "base_peers_xacct" {
  count         = length(var.base_peers_xacct)
  cidr_block    = var.base_peers_xacct[count.index]["cidr_block"]
  owner_id      = var.base_peers_xacct[count.index]["account_id"]
  vpc_id        = var.base_peers_xacct[count.index]["vpc_id"]
  peer_vpc_id   = var.mgmt_vpc_id
  peer_owner_id = var.aws_account_id
}

