data "cloudinit_config" "cpc-front" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "cpc-front"
        DOMAIN_NAME = local.trunc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/cpc_front_setup.sh.tmpl",
      {
        ENVIRONMENT        = var.environment
        NODETYPE           = var.cpc-front_puppet_nodetype
        PRIVATE_DOMAIN     = var.private_domain_name
        AWS_ACCOUNT_ID     = var.aws_account_id
        KMS_KEY            = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        LOG_GROUP          = local.cpc_front_log
        #ACCOUNT_ENVIRONMENT = var.account_environment
        ACCOUNT_ENVIRONMENT = "live" # test line
    })
  }
}

data "cloudinit_config" "cpc-back" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "cpc-back"
        DOMAIN_NAME = local.trunc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/cpc_back_setup.sh.tmpl",
      {
        ENVIRONMENT         = var.environment
        NODETYPE            = var.cpc-back_puppet_nodetype
        PRIVATE_DOMAIN      = var.private_domain_name
        AWS_ACCOUNT_ID      = var.aws_account_id
        KMS_KEY             = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        LOG_GROUP           = local.cpc_back_log
        ACCOUNT_ENVIRONMENT = var.account_environment
    })
  }
}
