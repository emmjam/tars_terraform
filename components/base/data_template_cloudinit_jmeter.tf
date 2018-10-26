data "template_file" "jmeter" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "jmeter"
    domain_name = "${local.vpc_domain_name}"
  }
}

data "template_file" "jmeter_config" {
  template = "${file("${path.module}/templates/jmeter_setup.sh.tmpl")}"

  vars {
    environment    = "${var.environment}"
    nodetype       = "${var.jmeter_puppet_nodetype}"
    kms_key        = "${var.jmeter_puppet_kms_key}"
    aws_account_id = "${var.aws_account_id}"
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
