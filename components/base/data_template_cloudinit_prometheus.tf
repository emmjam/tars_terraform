data "template_file" "prometheus" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "prometheus"
    domain_name = "${local.vpc_domain_name}"
  }
}

data "template_file" "prometheus_config" {
  template = "${file("${path.module}/templates/prometheus_setup.sh.tmpl")}"

  vars {
    nodetype       = "prometheus"
    environment    = "${var.environment}"
    kms_key        = "${var.jmeter_puppet_kms_key}"
    aws_account_id = "${var.aws_account_id}"
    aws_region     = "${var.aws_region}"
    efs_id         = "${aws_efs_file_system.prometheus.id}"
    mount_point    = "/var/lib/prometheus"
  }
}

data "template_cloudinit_config" "prometheus" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.prometheus.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.prometheus_config.rendered}"
  }
}
