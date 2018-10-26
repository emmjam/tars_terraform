data "template_file" "prometheus" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "prometheus"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "prometheus_config" {
  template = "${file("${path.module}/templates/prometheus_setup.sh.tmpl")}"

  vars {
    NODETYPE       = "prometheus"
    ENVIRONMENT    = "${var.environment}"
    KMS_KEY        = "${var.jmeter_puppet_kms_key}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    AWS_REGION     = "${var.aws_region}"
    EFS_ID         = "${aws_efs_file_system.prometheus.id}"
    MOUNT_POINT    = "/var/lib/prometheus"
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
