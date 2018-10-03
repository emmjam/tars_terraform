resource "aws_security_group" "prometheus" {
  name        = "${local.csi}/prometheus"
  description = "Prometheus"
  vpc_id      = "${aws_vpc.vpc.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/prometheus"
    )
  )}"
}
