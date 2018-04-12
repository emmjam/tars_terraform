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