# Get an eip for each public subnet for the NAT Gateway

resource "aws_eip" "nat" {
  count = "${length(var.alb_public_subnets_cidrs)}"
  vpc   = true
}
