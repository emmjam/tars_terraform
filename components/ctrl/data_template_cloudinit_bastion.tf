data "template_file" "bastion" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "bastion"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "bastion_env" {
  template = "${file("${path.module}/templates/bastion_setup.sh.tmpl")}"

  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "bastion"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
  }
}

data "template_cloudinit_config" "bastion" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.bastion.rendered}"
  }
  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.bastion_env.rendered}"
  }
}
