# Create the cloud init template for the wildfly batch server
data "template_file" "bobj" {
  template = "${file("${path.module}/templates/bobj_setup.ps1.tmpl")}"

  # Set puppet factors
  vars {
    SEARCH_SUFFIX = "${local.vpc_domain_name}"
  }
}
