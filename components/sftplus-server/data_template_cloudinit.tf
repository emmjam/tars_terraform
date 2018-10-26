# Create the cloud init template for common config
data "template_file" "common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "sftpplus_svr"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "sftpplus_svr" {
  template = "${file("${path.module}/templates/sftpplus_svr_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.sftpplus-svr_puppet_nodetype}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    EFS_ID         = "${aws_efs_file_system.sftpplus.id}"
    MOUNT_POINT    = "/efs"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "sftpplus_svr" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.sftpplus_svr.rendered}"
  }
}
