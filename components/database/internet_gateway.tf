# Create the internet gateway
resource "aws_internet_gateway" "dba" {
  vpc_id = "${aws_vpc.vpc.id}"

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
