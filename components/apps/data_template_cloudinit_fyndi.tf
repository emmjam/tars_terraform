# Create the cloud init template for common config
data "template_file" "common-front" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "fyndi-f"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "common-back" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "fyndi-b"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "fyndi-f" {
  template = "${file("${path.module}/templates/fyndi_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.fyndi-f_puppet_nodetype}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    LOG_GROUP      = "${local.fyndi_front_log}"
  }
}

data "template_file" "fyndi-b" {
  template = "${file("${path.module}/templates/fyndi_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "${var.fyndi-b_puppet_nodetype}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    LOG_GROUP      = "${local.fyndi_back_log}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "fyndi-f" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common-front.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.fyndi-f.rendered}"
  }
}

data "template_cloudinit_config" "fyndi-b" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common-back.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.fyndi-b.rendered}"
  }
}
