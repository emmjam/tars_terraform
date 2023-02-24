resource "aws_security_group" "sg1" {
  count = var.account_environment == "nonprod" ? 1 : 0
  name = "sg1"
  vpc_id      = aws_vpc.vpc.id
  description = " Create a new sg1 if its nonprod env "
 

    tags = {
    Name = "security_group_${count.index}"
  }
}

resource "aws_security_group" "sg2" {
  count = var.account_environment == "nonprod" ? 1 : 0
  name = "sg2"
  vpc_id      = aws_vpc.vpc.id
  description = " Create a new sg2 if its nonprod env"

    tags = {
    Name = "security_group_${count.index}"
  }
}


#create a single instance of each rule

resource "aws_security_group_rule" "egress_sg1" {

  count = var.account_environment == "nonprod" ? 1 : 0
  type        = "egress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.sg2[count.index].id
  source_security_group_id = aws_security_group.sg1[count.index].id
  description = "Allow outbound traffic for sg1"

}

resource "aws_security_group_rule" "ingress_sg2" {

  count = var.account_environment == "nonprod" ? 1 : 0
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.sg1[count.index].id
  source_security_group_id = aws_security_group.sg2[count.index].id
  description = "Allow inbound traffic for sg2"


}
