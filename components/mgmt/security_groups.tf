resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-${var.component}-common"
  description = "Common SG for all microservices"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "common"
      ),
    )
  )}"
}

resource "aws_security_group" "mgmt" {
  name        = "${var.project}-${var.environment}-${var.component}-mgmt"
  description = "Common SG for everything in MGMT environment"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "mgmt"
      ),
    )
  )}"
}

resource "aws_security_group" "alb_public" {
  name        = "${var.project}-${var.environment}-${var.component}-alb-public"
  description = "Common SG for public ALB"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "alb-public"
      ),
    )
  )}"
}

resource "aws_security_group" "build" {
  name        = "${var.project}-${var.environment}-${var.component}-build"
  description = "Common SG for build instances"
  vpc_id      = "${aws_vpc.mgmt.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "build"
      ),
    )
  )}"
}

