data "template_file" "grafana" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "grafana"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

data "template_cloudinit_config" "grafana" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.grafana.rendered}"
  }
}
