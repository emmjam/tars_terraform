# Create the cloud init template for common config
data "template_file" "wildfly-back-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "tars-back"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly backend core server
data "template_file" "wildfly-back-config" {
  template = "${file("${path.module}/templates/wildfly_back_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.wildfly-back_puppet_nodetype}"
    KMS_KEY        = "${var.wildfly-back_puppet_kms_key}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "wildfly-back" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.wildfly-back-common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wildfly-back-config.rendered}"
  }
}
