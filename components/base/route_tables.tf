resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

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

resource "aws_route_table" "jenkins_nat" {
  count  = "${length(var.jenkins_nat_subnets_cidrs)}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "jenkins-nat",
      ),
    )
  )}"
}

resource "aws_route_table" "backend" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "backend",
      ),
    )
  )}"
}

resource "aws_route_table" "rds" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "rds",
      ),
    )
  )}"
}