#this code creates an egress rule that allows outbound TCP traffic on port 433 to a specific security group 

resource "aws_security_group_rule" "sg1_to_sg2_egress" {
  type              = "egress"
  from_port         = 433
  to_port           = 433
  protocol          = "tcp"
  security_group_id = ["${aws_security_group.sg2_to_sg1_ingress.id}"]
  
}