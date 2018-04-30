data "aws_vpc_peering_connection" "ctrl_peers_local" {
  count         = "${length(var.ctrl_peers_local)}"
  cidr_block    = "${lookup(var.ctrl_peers_local[count.index], "cidr_block")}"
  owner_id      = "${lookup(var.ctrl_peers_local[count.index], "account_id")}"
  vpc_id        = "${lookup(var.ctrl_peers_local[count.index], "vpc_id")}"
  peer_vpc_id   = "${var.mgmt_vpc_id}"
  peer_owner_id = "${var.aws_account_id}"
}
