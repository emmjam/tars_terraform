# Create the cloud init template for common config
data "template_file" "common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "xenco"
    domain_name = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "xenco" {
  template = "${file("${path.module}/templates/xenco_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment    = "${var.environment}"
    nodetype       = "xenco"
    kms_key        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    aws_account_id = "${var.aws_account_id}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "xenco" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.xenco.rendered}"
  }
}
