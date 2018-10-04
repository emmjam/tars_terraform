resource "aws_security_group" "grafana_alb" {
  name        = "${local.csi}-grafana-alb"
  description = "SG for Grafana ALB"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/grafana-elb"
    )
  )}"
}
