# Create the cloud init template for common config
data "template_file" "common-back" {
  template = file("${path.module}/templates/cloudinit_common.yaml.tmpl")

  vars = {
    NODETYPE    = "cpc-back"
    DOMAIN_NAME = local.vpc_domain_name
  }
}

data "template_file" "common-front" {
  template = file("${path.module}/templates/cloudinit_common.yaml.tmpl")

  vars = {
    NODETYPE    = "cpc-front"
    DOMAIN_NAME = local.vpc_domain_name
  }
}

# Create the cloud init template for the cpc front server
data "template_file" "cpc-front" {
  template = file("${path.module}/templates/cpc_front_setup.sh.tmpl")

  # Set puppet factors
  vars = {
    ENVIRONMENT    = var.environment
    NODETYPE       = var.cpc-front_puppet_nodetype
    AWS_ACCOUNT_ID = var.aws_account_id
    KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
    LOG_GROUP      = local.cpc_front_log
  }
}

# Create the cloud init template for the cpc back server
data "template_file" "cpc-back" {
  template = file("${path.module}/templates/cpc_back_setup.sh.tmpl")

  # Set puppet factors
  vars = {
    ENVIRONMENT    = var.environment
    NODETYPE       = var.cpc-back_puppet_nodetype
    AWS_ACCOUNT_ID = var.aws_account_id
    KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
    LOG_GROUP      = local.cpc_back_log
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "cpc-back" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.common-back.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.cpc-back.rendered
  }
}

data "template_cloudinit_config" "cpc-front" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.common-front.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.cpc-front.rendered
  }
}

