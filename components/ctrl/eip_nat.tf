resource "aws_eip" "nat" {
  count = length(var.ctrl_nat_subnets_cidrs)
  vpc   = true
}

