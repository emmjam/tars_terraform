resource "aws_alb" "prometheus-public" {
  
  #"prometheus-public" hits 32 char limit
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "prom-public"
  )}"

  internal = "false"

  security_groups = ["${aws_security_group.prometheus-alb-public.id}"]

  subnets = [
    "${module.alb_public_subnets.subnet_ids}",
  ]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "prometheus-public"
      ),
    )
  )}"
}
