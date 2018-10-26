# Create the cloud init template for common config
data "template_file" "common-front" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "fyndi-f"
    domain_name = "${local.vpc_domain_name}"
  }
}

data "template_file" "common-back" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "fyndi-b"
    domain_name = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "fyndi-f" {
  template = "${file("${path.module}/templates/fyndi_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment    = "${var.environment}"
    nodetype       = "${var.fyndi-f_puppet_nodetype}"
    kms_key        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    aws_account_id = "${var.aws_account_id}"
  }
}

data "template_file" "fyndi-b" {
  template = "${file("${path.module}/templates/fyndi_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment    = "${var.environment}"
    nodetype       = "${var.fyndi-b_puppet_nodetype}"
    kms_key        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    aws_account_id = "${var.aws_account_id}"
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
