################################################################################
#
# CloudInit data
#
################################################################################

data "template_cloudinit_config" "squidnat" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.squidnat_cloudinit_config.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.squidnat_puppet.rendered}"
  }
}


data "template_file" "squidnat_cloudinit_config" {
  template = "${file("${path.module}/templates/cloudinit_config_squidnat.yaml.tmpl")}"

  vars {
    nodetype                 = "${var.module}"
    environment              = "${var.environment}"
    root_domain_name         = "${var.root_domain_name}"
    squid_whitelist_rendered = "${data.template_file.squid_whitelist_file.rendered}"
  }
}

data "template_file" "squidnat_puppet" {
  template = "${file("${path.module}/templates/squidnat_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment    = "${var.environment}"
    nodetype   = "${var.squidnat_puppet_nodetype}"
    kms_key = "${var.kms_key_id}"
    aws_account_id = "${var.aws_account_id}"
  }
}


data "template_file" "squid_whitelist_file" {
  template = "${file("${path.module}/templates/squid_whitelist_file.tmpl")}"

  vars {
    squid_whitelist_cidrs = "${join("\n",var.whitelist_cidrs)}"
  }
}
