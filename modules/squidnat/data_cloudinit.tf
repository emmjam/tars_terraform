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
    NODETYPE                 = "${var.module}"
    ENVIRONMENT              = "${var.environment}"
    ROOT_DOMAIN_NAME         = "${var.root_domain_name}"
    SQUID_WHITELIST_RENDERED = "${data.template_file.squid_whitelist_file.rendered}"
  }
}

data "template_file" "squidnat_puppet" {
  template = "${file("${path.module}/templates/squidnat_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.squidnat_puppet_nodetype}"
    KMS_KEY        = "${var.kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
  }
}


data "template_file" "squid_whitelist_file" {
  template = "${file("${path.module}/templates/squid_whitelist_file.tmpl")}"

  vars {
    SQUID_WHITELIST_CIDRS = "${join("\n",var.whitelist_cidrs)}"
  }
}
