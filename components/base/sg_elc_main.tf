resource "aws_security_group" "elc_main" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "elc_main"
  )}"

  description = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "elc_main"
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
        "elc_main"
      ),
      "Component", var.component
    )
  )}"
}
