output "bastion_sg_id" {
  value = "${module.bastion.security_group_id}"
}

output "bastion_elb_sg_id" {
  value = "${aws_security_group.bastion_elb.id}"
}

output "vpc_id" {
  value = "${aws_vpc.ctrl.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.ctrl.cidr_block}"
}

output "rt_private_nat_id" {
  value = "${aws_route_table.private_nat.id}"
}

output "rt_private_id" {
  value = "${aws_route_table.private.id}"
}

## Output the SES user secrets

output "secret" {
  value = "${aws_iam_access_key.ses_user.secret}"
}

output "user" {
  value = "${aws_iam_access_key.ses_user.user}"
}

output "access_key" {
  value = "${aws_iam_access_key.ses_user.id}"
}

output "ses_password" {
  value = "${aws_iam_access_key.ses_user.ses_smtp_password}"
}

output "jenkinsctrl_sg_id" {
  value = "${module.jenkinsnode.security_group_id}"
}

