data "template_file" "cloudinit_config_eyaml" {
  template = "${file("${path.module}/templates/cloudinit_config_eyaml.yaml.tmpl")}"

  vars {
    AWS_REGION = "${var.aws_region}"
    KMS_KEY_ID = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
  }
}
