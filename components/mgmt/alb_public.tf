resource "aws_alb" "public" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "public"
  )}"

  internal = "false"

  enable_cross_zone_load_balancing = true
  enable_http2 = true

  security_groups = [
    "${aws_security_group.alb_public.id}",
  ]

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
        "public"
      ),
    )
  )}"
}
