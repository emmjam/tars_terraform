resource "aws_security_group" "prometheus-alb-private" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "prometheus-alb-private"
  )}"


  description = "Prometheus ALB Private"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "prometheus-alb-private"
      ),
    )
  )}"
}