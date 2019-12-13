data "aws_vpc_peering_connection" "ctrl_peers_xacct" {
  count         = length(var.ctrl_peers_xacct)
  cidr_block    = var.ctrl_peers_xacct[count.index]["cidr_block"]
  owner_id      = var.ctrl_peers_xacct[count.index]["account_id"]
  vpc_id        = var.ctrl_peers_xacct[count.index]["vpc_id"]
  peer_vpc_id   = var.mgmt_vpc_id
  peer_owner_id = var.aws_account_id
}

