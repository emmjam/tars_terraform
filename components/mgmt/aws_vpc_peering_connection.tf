data "aws_vpc_peering_connection" "ctrl_peers" {
  count         = "${length(var.ctrl_peers)}"
  cidr_block    = "${lookup(var.ctrl_peers[count.index],"cidr_block")}"
  owner_id      = "${lookup(var.ctrl_peers[count.index],"account_id")}"
  vpc_id        = "${lookup(var.ctrl_peers[count.index],"vpc_id")}"
  peer_vpc_id   = "${aws_vpc.mgmt.id}"
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
}

data "aws_vpc_peering_connection" "dev01_peers" {
  count         = "${length(var.dev01_peers)}"
  cidr_block    = "${lookup(var.dev01_peers[count.index],"cidr_block")}"
  owner_id      = "${lookup(var.dev01_peers[count.index],"account_id")}"
  vpc_id        = "${lookup(var.dev01_peers[count.index],"vpc_id")}"
  peer_vpc_id   = "${aws_vpc.mgmt.id}"
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
}

data "aws_vpc_peering_connection" "opsdev_peers" {
  count         = "${length(var.opsdev_peers)}"
  cidr_block    = "${lookup(var.opsdev_peers[count.index],"cidr_block")}"
  owner_id      = "${lookup(var.opsdev_peers[count.index],"account_id")}"
  vpc_id        = "${lookup(var.opsdev_peers[count.index],"vpc_id")}"
  peer_vpc_id   = "${aws_vpc.mgmt.id}"
  peer_owner_id = "${data.aws_caller_identity.current.account_id}"
}