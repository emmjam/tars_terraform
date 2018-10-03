resource "aws_security_group" "prometheus-alb-public" {
  name        = "${local.csi}/prometheus-alb-public"
  description = "Prometheus ALB Public"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/prometheus-alb-public"
    )
  )}"
}
