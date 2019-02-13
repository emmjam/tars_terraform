# Create the cloud init template for common config
data "template_file" "common-cpc-batch" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "cpc-batch"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the cpc batch server
data "template_file" "cpc-batch" {
  template = "${file("${path.module}/templates/cpc_batch_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.cpc-batch_puppet_nodetype}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    EFS_ID         = "${aws_efs_file_system.cpc-batch-efs.id}"
    MOUNT_POINT    = "/efs"
    LOG_GROUP      = "${local.cpc_batch_log}"
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
