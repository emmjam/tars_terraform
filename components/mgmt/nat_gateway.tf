resource "aws_nat_gateway" "mgmt" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${element(module.nat_subnets.subnet_ids,0)}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", local.csi
    )
  )}"
}
