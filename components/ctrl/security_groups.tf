resource "aws_security_group" "bastion_elb" {
  name        = "${local.csi}-bastion-elb"
  description = "SG for Bastion ELB"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bastion-elb"
    )
  )}"
}

resource "aws_security_group" "bastion" {
  name        = "${local.csi}-bastion"
  description = "SG for the ctrl Bastion server"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/bastion"
    )
  )}"
}

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
