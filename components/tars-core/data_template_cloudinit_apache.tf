data "cloudinit_config" "apache" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "apache-routing"
        DOMAIN_NAME = local.trunc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/apache_setup.sh.tmpl", 
      {
        NODETYPE       = "apache-routing"
        ENVIRONMENT    = var.environment
        PRIVATE_DOMAIN = var.private_domain_name
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        LOG_GROUP      = local.apache_log
      })
  }
}
