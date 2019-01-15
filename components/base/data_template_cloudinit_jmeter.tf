data "template_file" "jmeter" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "jmeter"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "jmeter_config" {
  template = "${file("${path.module}/templates/jmeter_setup.sh.tmpl")}"

  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.jmeter_puppet_nodetype}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
  }
}

data "template_cloudinit_config" "jmeter" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.jmeter.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jmeter_config.rendered}"
  }
}
