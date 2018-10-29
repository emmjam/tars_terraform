# Create the cloud init template for common config
data "template_file" "wildfly-front-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "tars-front"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly frontend core server
data "template_file" "wildfly-front-config" {
  template = "${file("${path.module}/templates/wildfly_front_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.wildfly-front_puppet_nodetype}"
    KMS_KEY        = "${var.wildfly-front_puppet_kms_key}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "wildfly-front" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.wildfly-front-common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wildfly-front-config.rendered}"
  }
}
