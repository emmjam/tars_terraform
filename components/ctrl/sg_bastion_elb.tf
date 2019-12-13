resource "aws_security_group" "bastion_elb" {
  name        = "${local.csi}-bastion-elb"
  description = "SG for Bastion ELB"
  vpc_id      = aws_vpc.ctrl.id

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/bastion-elb"
    },
  )
}

