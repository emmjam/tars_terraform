# TODO: peacheym: This is a duplicate of the group created
#                 by the grafana microservice module and should
#                 be removed
resource "aws_security_group" "grafana" {
  name        = "${local.csi}-grafana"
  description = "SG for the ctrl Grafana server"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/grafana"
    )
  )}"
}
