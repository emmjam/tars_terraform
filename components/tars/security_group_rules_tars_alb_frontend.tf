# # TARS Private ALB frontend rules
# resource "aws_security_group_rule" "tars_alb_frontend_ingress_public_alb_port_8080" {
#   description              = "Allow TCP/8080 from public alb"
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.tars-alb-frontend.id}"
#   source_security_group_id = "${aws_security_group.tars-alb-public.id}"
# }

# resource "aws_security_group_rule" "tars_alb_frontend_ingress_public_alb_port_9990" {
#   description              = "Allow TCP/9990 from public alb"
#   type                     = "ingress"
#   from_port                = 9990
#   to_port                  = 9990
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.tars-alb-frontend.id}"
#   source_security_group_id = "${aws_security_group.tars-alb-public.id}"
# }

# resource "aws_security_group_rule" "tars_alb_frontend_egress_tars_front_port_8080" {
#   description              = "Allow TCP/8080 to tars core frontend"
#   type                     = "egress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.tars-alb-frontend.id}"
#   source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
# }

# resource "aws_security_group_rule" "tars_alb_frontend_egress_tars_front_port_9990" {
#   description              = "Allow TCP/9990 to tars core frontend"
#   type                     = "egress"
#   from_port                = 9990
#   to_port                  = 9990
#   protocol                 = "tcp"
#   security_group_id        = "${aws_security_group.tars-alb-frontend.id}"
#   source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
# }
