# output "hieradata_kms_key_id" {
#   value = "${module.kms_hieradata.key_id}"
# }

output "packer_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.packer.name}"
}

output "nat_public_ips" {
  value = "${aws_eip.nat.*.public_ip}"
}
