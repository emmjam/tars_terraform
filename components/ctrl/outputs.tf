output "bastion_sg_id" {
  value = "${module.bastion.security_group_id}"
}

output "bastion_elb_sg_id" {
    value = "${aws_security_group.bastion_elb.id}"
}
