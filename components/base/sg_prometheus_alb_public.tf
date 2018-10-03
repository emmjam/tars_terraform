resource "aws_security_group" "prometheus-alb-public" {
  name = "${format(
    "%s-%s-%s/%s",
    var.project,
    var.environment,
    var.component,
    "prometheus-alb-public"
  )}"


  description = "Prometheus ALB Public"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "prometheus-alb-public"
      ),
    )
  )}"
}