# fyndi-f to rds DB
resource "aws_security_group_rule" "aurora_db_ingress_fyndi-f" {
  description              = "Allow TCP/3306 from FYNDI Front"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ibs.ibs_aurora_sg_id}"
  source_security_group_id = "${aws_security_group.fyndi-f.id}"
}
# resource "aws_security_group_rule" "aurora_db_ingress_bastion" {
#   description              = "Allow TCP/3306 from bastion"
#   type                     = "ingress"
#   from_port                = 3306
#   to_port                  = 3306
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.fyndi-f_aurora.id}"
#   source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
# }
