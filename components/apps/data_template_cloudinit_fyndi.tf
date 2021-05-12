data "cloudinit_config" "fyndi-f" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "fyndi-f"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/fyndi_setup.sh.tmpl", 
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.fyndi-f_puppet_nodetype
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        LOG_GROUP      = local.fyndi_front_log
      })
  }
}

data "cloudinit_config" "fyndi-b" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "fyndi-b"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/fyndi_setup.sh.tmpl", 
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.fyndi-b_puppet_nodetype
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        LOG_GROUP      = local.fyndi_back_log
      })
  }
}