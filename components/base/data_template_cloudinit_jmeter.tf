data "cloudinit_config" "jmeter" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "jmeter"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/jmeter_setup.sh.tmpl", 
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.jmeter_puppet_nodetype
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        LOG_GROUP      = local.jmeter_log
      })
  }
}