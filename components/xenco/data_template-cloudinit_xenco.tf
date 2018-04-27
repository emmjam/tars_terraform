# Create the cloud init template for xenco
data "template_file" "xenco" {
  template = "${file("${path.module}/templates/xenco_setup.sh.tmpl")}"

  vars {
     rpms = "${lookup(var.xenconode,"rpms_to_install")}"
  }
  
}

# Render the template ready for the LC
data "template_cloudinit_config" "xenco" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.xenco.rendered}"
  }
}
