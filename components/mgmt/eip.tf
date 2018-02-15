resource "aws_eip" "nat" {
  count = "${length(var.nat_subnets_cidrs)}"
  vpc   = true
}
