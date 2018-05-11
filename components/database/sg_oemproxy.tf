resource "aws_security_group" "oemproxy" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "oemproxy"
  )}"

  description = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "oemproxy"
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
        "oemproxy"
      ),
      "Component", var.component
    )
  )}"
}
