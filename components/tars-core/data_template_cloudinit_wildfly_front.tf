data "cloudinit_config" "wildfly-front" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "tars-front"
        DOMAIN_NAME = local.trunc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/wildfly_front_setup.sh.tmpl",
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.wildfly-front_puppet_nodetype
        PRIVATE_DOMAIN = var.private_domain_name
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        LOG_GROUP      = local.tars_front_log
    })
  }
}
