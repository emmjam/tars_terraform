output "hieradata_kms_key_id" {
  value = "${module.kms_hieradata.key_id}"
}

output "tars_core_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.tars-core.name}"
}