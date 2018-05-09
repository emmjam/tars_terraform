# Public Route Table for any public subnet within the VPC
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  # Apply default tags, and merge with additional tags
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "public"
      ),
      "Component", var.component
    )
  )}"
}

resource "aws_route_table" "private_nat" {
  count  = "${length(var.squidnat_subnets_cidrs)}"
  vpc_id = "${aws_vpc.vpc.id}"

  # Apply default tags, and merge with additional tags
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "private_nat"
      ),
      "Component", var.component
    )
  )}"
}

resource "aws_route_table" "private_nonat" {
  vpc_id = "${aws_vpc.vpc.id}"

  # Apply default tags, and merge with additional tags
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "private_nonat"
      ),
      "Component", var.component
    )
  )}"
}

resource "aws_route_table" "private_natgw" {
  vpc_id = "${aws_vpc.vpc.id}"

  # Apply default tags, and merge with additional tags
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "private_natgw"
      ),
      "Component", var.component
    )
  )}"
}

