# AMI Builder
# resource "aws_security_group_rule" "ami_builder_egress_internet_https" {
#   description       = "Allow TCP/443 to Internet"
#   type              = "egress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   security_group_id = "${aws_security_group.ami_builder.id}"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "ami_builder_egress_internet_http" {
#   description       = "Allow TCP/80 to Internet"
#   type              = "egress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   security_group_id = "${aws_security_group.ami_builder.id}"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "jenkinsnode_egress_self_ssh" {
#   description       = "Allow TCP/22 to JenkinsNode"
#   type              = "egress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   self              = "true"
#   security_group_id = "${module.jenkinsnode.security_group_id}"
# }

# resource "aws_security_group_rule" "jenkinsnode_ingress_self_ssh" {
#   description       = "Allow TCP/22 from JenkinsNode"
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   self              = "true"
#   security_group_id = "${module.jenkinsnode.security_group_id}"
# }