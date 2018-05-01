# Create the cloud init template for common config
data "template_file" "wildfly-batch-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "wildlfy-batch"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "wildfly-batch-config" {
  template = "${file("${path.module}/templates/wildfly_batch_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "${var.environment}"
    node   = "${var.wildfly-batch_puppet_node}"
    type   = "${var.wildfly-batch_puppet_type}"
    kms_key = "${var.wildfly-batch_puppet_kms_key}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "wildfly-batch" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.wildfly-batch-common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wildfly-batch-config.rendered}"
  }
}
