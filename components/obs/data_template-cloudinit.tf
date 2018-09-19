# Create the cloud init template for common config
data "template_file" "common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "obs"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "obs" {
  template = "${file("${path.module}/templates/obs_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment = "${var.environment}"
    puppet_environment  = "${var.puppet_environment}"
    nodetype   = "${var.obs_puppet_nodetype}"
    kms_key = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    aws_account_id = "${var.aws_account_id}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "obs" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.obs.rendered}"
  }
}
