resource "aws_alb" "public" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "public"
  )}"

  internal = "false"

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
