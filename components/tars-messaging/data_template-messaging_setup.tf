data "template_file" "messaging_setup" {
  template = "${file("${path.module}/templates/messaging_setup.ps1.tmpl")}"

  vars {
    search_suffix = "${var.environment}.${var.private_domain_name}"
  }
}

# Render the templates for the lc

data "template_cloudinit_config" "messaging_setup" {
  gzip          = true
  base64_encode = true

part {
  content = "{$data.tepmplate_file.messaging_setup.rendered}"
  }
}
