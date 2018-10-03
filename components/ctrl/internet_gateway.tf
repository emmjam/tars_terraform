resource "aws_internet_gateway" "ctrl" {
  vpc_id = "${aws_vpc.ctrl.id}"

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
