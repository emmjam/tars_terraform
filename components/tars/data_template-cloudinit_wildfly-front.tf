data "template_file" "wildfly-front-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

}

data "template_file" "wildfly-front-config" {
  template = "${file("${path.module}/templates/wildfly_front_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env     = "${lookup(var.wildfly-front,"puppet_env")}"
    node    = "${lookup(var.wildfly-front,"puppet_node")}"
    type    = "${lookup(var.wildfly-front,"puppet_type")}"
    kms_key = "${lookup(var.wildfly-front,"puppet_kms_key")}"
  }
}

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
