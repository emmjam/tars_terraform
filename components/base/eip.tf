# Get an eip for each public subnet for the NAT Gateway

resource "aws_eip" "nat" {
  count = "${length(var.jenkins_nat_subnets_cidrs)}"
  vpc   = true
}
