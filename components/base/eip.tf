resource "aws_eip" "nat" {
  count = "${length(var.alb_public_subnets_cidrs)}"
  vpc   = true
}
