resource "aws_eip" "nat" {
  count = "${length(var.nat_subnets_cidr)}"
  vpc = true
}
