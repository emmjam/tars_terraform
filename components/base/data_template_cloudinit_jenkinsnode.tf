# Create the common cloud init template
data "template_file" "jenkinsnode" {
  template = file("${path.module}/templates/cloudinit_common.yaml.tmpl")

  vars = {
    NODETYPE    = "jenkinsnode"
    DOMAIN_NAME = local.vpc_domain_name
  }
}

# Create the jenkinsnode specific cloudinit script
data "template_file" "jenkinsnode_config" {
  template = file("${path.module}/templates/jenkinsnode_setup.sh.tmpl")

  vars = {
    NODETYPE       = "jenkinsnode"
    ENVIRONMENT    = var.environment
    AWS_ACCOUNT_ID = var.aws_account_id
    KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
    MASTER_URL     = "jenkins.mgmt.mgmt.tars.dvsa.aws" # TODO: Use remote state
    ACCOUNT_ALIAS  = var.environment
    EXECUTORS      = var.jenkinsnode_executors
    LOG_GROUP      = local.jenkinsnode_log
  }
}

# Render the templates ready for the Launch Config
data "template_cloudinit_config" "jenkinsnode" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.jenkinsnode.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.jenkinsnode_config.rendered
  }
}

