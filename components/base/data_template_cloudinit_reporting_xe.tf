data "cloudinit_config" "reporting_xe" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "reporting-xe"
        DOMAIN_NAME = local.vpc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/reporting_xe_setup.sh.tmpl",
      {
        PROJECT        = var.project
        NODETYPE       = "reporting-xe"
        ENVIRONMENT    = var.environment
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        AWS_REGION     = var.aws_region
        LOG_GROUP      = local.reporting_xe_log
    })
  }
}
