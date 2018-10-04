resource "aws_internet_gateway" "mgmt" {
  vpc_id = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "ig"
      ),
    )
  )}"
}
