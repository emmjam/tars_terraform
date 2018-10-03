# Create the cloud init template for common config
data "template_file" "common-cpc-batch" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "cpc-batch"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

# Create the cloud init template for the cpc batch server
data "template_file" "cpc-batch" {
  template = "${file("${path.module}/templates/cpc_batch_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment = "${var.environment}"
    puppet_environment  = "${var.puppet_environment}"
    nodetype   = "${var.cpc-batch_puppet_nodetype}"
    aws_account_id = "${var.aws_account_id}"
    kms_key = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    EFS_ID      = "${aws_efs_file_system.cpc-batch-efs.id}"
    MOUNT_POINT = "/efs"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "cpc-batch" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common-cpc-batch.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.cpc-batch.rendered}"
  }
}
