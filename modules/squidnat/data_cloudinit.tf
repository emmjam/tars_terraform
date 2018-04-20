################################################################################
#
# CloudInit data
#
################################################################################

data "template_file" "squidnat_cloudinit_config" {
  template = "${file("${path.module}/templates/cloudinit_config_squidnat.yaml.tmpl")}"

  vars {
    nodetype                 = "${var.module}"
    environment              = "${var.environment}"
    root_domain_name         = "${var.root_domain_name}"
    squid_whitelist_rendered = "${data.template_file.squid_whitelist_file.rendered}"
  }
}

data "template_file" "squid_whitelist_file" {
  template = "${file("${path.module}/templates/squid_whitelist_file.tmpl")}"

  vars {
    squid_whitelist_cidrs = "${join("\n",var.whitelist_cidrs)}"
  }
}
