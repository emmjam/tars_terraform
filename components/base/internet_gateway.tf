# Create the internet gateway
resource "aws_internet_gateway" "tars" {
  vpc_id = "${aws_vpc.vpc.id}"

  # TODO: peacheym: ig in Name tag is superfluous
  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/ig"
    )
  )}"
}
