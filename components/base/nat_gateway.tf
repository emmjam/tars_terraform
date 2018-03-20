resource "aws_nat_gateway" "tars" {
  count         = "${length(var.jenkins_nat_subnets_cidrs)}"
  allocation_id = "${element(aws_eip.nat.*.id,count.index)}"
  subnet_id     = "${element(module.nat_subnets.subnet_ids,count.index)}"

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
