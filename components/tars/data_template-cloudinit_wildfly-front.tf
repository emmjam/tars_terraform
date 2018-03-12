data "template_file" "wildfly-front-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  # vars {
  #   nodetype    = "wildlfy-front"
  #   domain_name = "${var.environment}.${var.private_domain_name}"
  # }
}

data "template_file" "wildfly-front-config" {
  template = "${file("${path.module}/templates/wildfly_front_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "dev"
    node   = "wildfly"
    type   = "front"
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
