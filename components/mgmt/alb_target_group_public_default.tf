resource "aws_alb_target_group" "public_default" {
  name     = "default-public"
  port     = "443"
  protocol = "HTTPS"
  vpc_id   = "${aws_vpc.mgmt.id}"
}
