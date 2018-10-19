data "template_file" "grafana" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "grafana"
    domain_name = "${local.vpc_domain_name}"
  }
}

data "template_file" "grafana_config" {
  template = "${file("${path.module}/templates/grafana_setup.sh.tmpl")}"

  vars {
    nodetype           = "grafana"
    environment        = "${var.environment}"
    puppet_environment = "${var.puppet_environment}"
    aws_account        = "${var.aws_account_id}"
    aws_region         = "${var.aws_region}"
  }
}

data "template_cloudinit_config" "grafana" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.grafana.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.grafana_config.rendered}"
  }
}
