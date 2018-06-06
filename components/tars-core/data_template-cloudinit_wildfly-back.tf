# Create the cloud init template for common config
data "template_file" "wildfly-back-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "tars-back"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

# Create the cloud init template for the wildfly backend core server
data "template_file" "wildfly-back-config" {
  template = "${file("${path.module}/templates/wildfly_back_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment    = "${var.environment}"
    nodetype   = "${var.wildfly-back_puppet_nodetype}"
    kms_key = "${var.wildfly-back_puppet_kms_key}"
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
