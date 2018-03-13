data "template_file" "wildfly-back-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

}

data "template_file" "wildfly-back-config" {
  template = "${file("${path.module}/templates/wildfly_back_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "${lookup(var.wildfly-back,"puppet_env")}"
    node   = "${lookup(var.wildfly-back,"puppet_node")}"
    type   = "${lookup(var.wildfly-back,"puppet_type")}"
    kms_key = "${lookup(var.wildfly-back,"puppet_kms_key")}"
  }
}

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
