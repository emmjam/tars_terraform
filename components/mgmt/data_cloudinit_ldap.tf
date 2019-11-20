/*
data "template_file" "cloudinit_config_facter_custom_ldap" {
  template = "${file("${path.module}/templates/cloudinit_config_facter_custom.yaml.tmpl")}"

  vars {
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    AWS_REGION     = "${var.aws_region}"
    COMPONENT      = "${var.component}"
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "ldap"
    PROJECT        = "${var.project}"
  }
}

data "template_file" "cloudinit_config_hostname_ldap" {
  template = "${file("${path.module}/templates/cloudinit_config_hostname_microservice.yaml.tmpl")}"

  vars {
    NODETYPE        = "ldap"
    VPC_DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}
*/

# The ldap cloud-init config as rendered to be user-data input
data "template_cloudinit_config" "ldap" {
  gzip          = true
  base64_encode = true

/*  # LDAP-specific template
  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudinit_config_hostname_ldap.rendered}"
  }

  # LDAP-specific template
  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudinit_config_facter_custom_ldap.rendered}"
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }
*/

  # Account-specific template
  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudinit_config_eyaml.rendered}"
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  # Generic facts template
  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloudinit_config_facter_generic.rendered}"
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  # Generic bootstrap script
  part {
    content_type = "text/x-shellscript"
    content      = "${file("${path.module}/files/cloudinit_bootstrap_microservice.sh")}"
  }
}
