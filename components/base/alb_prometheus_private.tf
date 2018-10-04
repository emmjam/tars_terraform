resource "aws_alb" "prometheus-private" {
  
  #"prometheus-private" hits 32 char limit
  name = "${format(
    "%s-%s",
    local.csi,
    "prom-private"
  )}"

  internal = "true"

  security_groups = [
    "${aws_security_group.prometheus-alb-private.id}",
  ]

  subnets = [
    "${module.subnets_prometheus_alb_private.subnet_ids}",
  ]

  tags = "${merge(
    local.default_tags,
    map(
      "Name", format(
        "%s/%s",
        local.csi,
        "prom-private"
      ),
    )
  )}"
}
