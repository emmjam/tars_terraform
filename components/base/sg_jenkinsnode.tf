# Security group that the OpenAM nodes will be attached to
resource "aws_security_group" "jenkinsnode" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkinsnode"
  )}"

  description = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "jenkinsnode"
  )}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "jenkinsnode"
      ),
      "Component", var.component
    )
  )}"
}
