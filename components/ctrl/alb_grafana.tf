resource "aws_alb" "grafana" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "grafana"
  )}"

  internal = "false"

  security_groups = [
    "${aws_security_group.grafana_alb.id}",
  ]

  subnets = [
    "${module.grafana_alb_subnets.subnet_ids}",
  ]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
      "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "grafana"
      ),
    )
  )}"
}