resource "aws_route53_zone_association" "vpc_ctrl" {
  zone_id = aws_route53_zone.vpc.zone_id
  vpc_id  = data.terraform_remote_state.ctrl.outputs.vpc_id
}
