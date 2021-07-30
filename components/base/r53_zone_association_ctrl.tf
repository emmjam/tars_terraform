resource "aws_route53_zone_association" "vpc_ctrl" {
  zone_id = aws_route53_zone.vpc.zone_id
  vpc_id  = data.terraform_remote_state.ctrl.outputs.vpc_id
}

resource "aws_route53_zone_association" "vpc_ctrl_private" {
  zone_id = aws_route53_zone.vpc_private.zone_id
  vpc_id  = data.terraform_remote_state.ctrl.outputs.vpc_id
}

resource "aws_route53_zone_association" "vol_vpc" {
  zone_id = aws_route53_zone.vpc_private.zone_id
  vpc_id  = var.vol_vpc
}
