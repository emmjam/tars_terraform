resource "aws_internet_gateway" "ctrl" {
  vpc_id = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", local.csi
    )
  )}"
}
