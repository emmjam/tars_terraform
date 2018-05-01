data "template_file" "jmeter" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "jmeter"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

data "template_cloudinit_config" "jmeter" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.jmeter.rendered}"
  }

}

