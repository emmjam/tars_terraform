# DMS rules
# Generic rules for the dms replication instance, and to be attached to the source/target dbs
resource "aws_security_group_rule" "tars_dms_ingress_1521" {
  description              = "Allow TCP/1521 inbound"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  self                     = true
  security_group_id        = "${aws_security_group.tars-dms.id}"
}

resource "aws_security_group_rule" "tars_dms_egress_1521" {
  description              = "Allow TCP/1521 outbound"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  self                     = true
  security_group_id        = "${aws_security_group.tars-dms.id}"
}

resource "aws_security_group_rule" "tars_dms_egress_capita_uat_db" {
  description       = "Allow TCP/1521 to Capita UAT DB at Cody Park"
  type              = "egress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-dms.id}"
  cidr_blocks       = [ "${var.capita_uat_db}"]
}

# Leaving this here for when we need it for prod.

# resource "aws_security_group_rule" "tars_dms_egress_capita_prod_db" {
#   description       = "Allow TCP/1521 to Capita Prod DB at West Malling"
#   type              = "egress"
#   from_port         = 1521
#   to_port           = 1521
#   protocol          = "tcp"
#   security_group_id = "${aws_security_group.tars-dms.id}"
#   cidr_blocks       = [ "${var.capita_prod_db}"]
# }
