# Create the cloud init template for common config
data "template_file" "common-ibs" {
  template = file("${path.module}/templates/cloudinit_common.yaml.tmpl")

  vars = {
    NODETYPE    = "ibs"
    DOMAIN_NAME = local.vpc_domain_name
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "ibs" {
  template = file("${path.module}/templates/ibs_setup.sh.tmpl")

  # Set puppet factors
  vars = {
    ENVIRONMENT    = var.environment
    NODETYPE       = var.ibs_puppet_nodetype
    KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
    AWS_ACCOUNT_ID = var.aws_account_id
    LOG_GROUP      = local.ibs_log
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "ibs" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.common-ibs.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.ibs.rendered
  }
}

