# Create the cloud init template for the wildfly batch server
data "template_file" "messaging" {
  template = "${file("${path.module}/templates/messaging_setup.ps1.tmpl")}"

  # Set puppet factors
  vars {
    search_suffix = "${local.vpc_domain_name}"
  }
}
