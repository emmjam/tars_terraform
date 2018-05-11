# Create the cloud init template for common config
data "template_file" "wildfly-mock-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "wildlfy-mock"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

# Create the cloud init template for the wildfly mock server
data "template_file" "wildfly-mock-config" {
  template = "${file("${path.module}/templates/wildfly_mock_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "${var.environment}"
    node   = "${var.wildfly-mock_puppet_node}"
    type   = "${var.wildfly-mock_puppet_type}"
    kms_key = "${var.wildfly-mock_puppet_kms_key}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "wildfly-mock" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.wildfly-mock-common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wildfly-mock-config.rendered}"
  }
}
