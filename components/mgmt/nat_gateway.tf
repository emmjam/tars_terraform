resource "aws_nat_gateway" "mgmt" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${element(module.nat_subnets.subnet_ids,0)}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "nat",
      ),
    )
  )}"
}
