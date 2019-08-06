resource "aws_alb" "public" {
  name     = "${local.csi}-public"
  internal = "false"

  enable_cross_zone_load_balancing = true
  enable_http2                     = true

  security_groups = [
    "${aws_security_group.alb_public.id}",
    "${aws_security_group.nexus_alb.id}",
  ]

  subnets = [
    "${module.alb_public_subnets.subnet_ids}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}-public"
    )
  )}"
}
