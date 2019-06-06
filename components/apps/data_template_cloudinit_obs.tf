# Create the cloud init template for common config
data "template_file" "common-obs" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "obs"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "obs" {
  template = "${file("${path.module}/templates/obs_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.obs_puppet_nodetype}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    LOG_GROUP      = "${local.obs_log}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "obs" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common-obs.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.obs.rendered}"
  }
}
