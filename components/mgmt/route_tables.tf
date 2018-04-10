resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "public",
      ),
    )
  )}"
}

resource "aws_route_table" "private_nat" {
  vpc_id = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "private-nat",
      ),
    )
  )}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "private",
      ),
    )
  )}"
}
