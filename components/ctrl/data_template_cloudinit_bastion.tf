data "template_file" "bastion" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "bastion"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_cloudinit_config" "bastion" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.bastion.rendered}"
  }
}
