data "template_file" "wildfly-batch-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "wildlfy-batch"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

data "template_file" "wildfly-batch-config" {
  template = "${file("${path.module}/templates/wildfly_batch_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "${lookup(var.wildfly-batch,"puppet_env")}"
    node   = "${lookup(var.wildfly-batch,"puppet_node")}"
    type   = "${lookup(var.wildfly-batch,"puppet_type")}"
    kms_key = "${lookup(var.wildfly-batch,"puppet_kms_key")}"
  }
}

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
