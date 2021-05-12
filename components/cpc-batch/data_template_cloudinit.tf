data "cloudinit_config" "cpc-batch" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "cpc-batch"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/cpc_batch_setup.sh.tmpl", 
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.cpc-batch_puppet_nodetype
        AWS_ACCOUNT_ID = var.aws_account_id
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        EFS_ID         = aws_efs_file_system.cpc-batch-efs.id
        MOUNT_POINT    = "/efs"
        LOG_GROUP      = local.cpc_batch_log
      })
  }
}