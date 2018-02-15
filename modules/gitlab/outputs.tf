output "public_elb_dns_name" {
  value = "${aws_elb.gitlab_public.dns_name}"
}

output "public_elb_zone_id" {
  value = "${aws_elb.gitlab_public.zone_id}"
}

output "elb_private_sg_id" {
  value = "${aws_security_group.elb_private.id}"
}

output "gitlab_sg_id" {
  value = "${module.gitlab.security_group_id}"
}

output "ebs_volume_id" {
  value = "${aws_ebs_volume.gitlab.id}"
}

output "gitlab_asg_id" {
  value = "${module.gitlab.autoscaling_group_id}"
}
