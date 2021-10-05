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

resource "aws_security_group_rule" "oraclexe_egress_s3_https" {
  description       = "Allow HTTPS to s3 vpc endpoint"
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = aws_security_group.oraclexe.id

  prefix_list_ids = [
    data.terraform_remote_state.ctrl.outputs.vpc_endpoint_s3_prefix_list_id,
  ]
}

