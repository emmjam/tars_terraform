# Create the cloud init template for common config
data "template_file" "common-back" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "cpc-back"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

data "template_file" "common-front" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "cpc-front"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

# Create the cloud init template for the cpc front server
data "template_file" "cpc-front" {
  template = "${file("${path.module}/templates/cpc_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "${var.environment}"
    nodetype   = "${var.cpc-front_puppet_nodetype}"
    aws_account_id = "${var.aws_account_id}"
    kms_key = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
  }
}

# Create the cloud init template for the cpc back server
data "template_file" "cpc-back" {
  template = "${file("${path.module}/templates/cpc_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    env    = "${var.environment}"
    nodetype   = "${var.cpc-back_puppet_nodetype}"
    aws_account_id = "${var.aws_account_id}"
    kms_key = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "cpc-back" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common-back.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.cpc-back.rendered}"
  }
}

data "template_cloudinit_config" "cpc-front" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.common-front.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.cpc-front.rendered}"
  }
}
