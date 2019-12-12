# OracleXE rules
# resource "aws_security_group_rule" "oraclexe_egress_internet" {
#   description       = "Allow internet"
#   type              = "egress"
#   from_port         = "-1"
#   to_port           = "-1"
#   protocol          = "-1"
#   security_group_id = "${aws_security_group.oraclexe.id}"
#   cidr_blocks = [
#     "0.0.0.0/0",
#   ]
# }
