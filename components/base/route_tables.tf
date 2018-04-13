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
# Route table for the Jenkinsnode
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

# Route table for the TARS backend/batch servers
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

# Route table for the TARS web servers
resource "aws_route_table" "web" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "web",
      ),
    )
  )}"
}

# Route table for the TARS messaging servers
resource "aws_route_table" "messaging" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "messaging",
      ),
    )
  )}"
}

# Route table for the RDS DB's
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

# Route table for AWS MQ
resource "aws_route_table" "awsmq" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "awsmq",
      ),
    )
  )}"
}
