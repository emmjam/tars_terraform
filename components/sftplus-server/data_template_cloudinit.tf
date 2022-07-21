data "cloudinit_config" "sftpplus_svr" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "sftpplus_svr"
        DOMAIN_NAME = local.vpc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/sftpplus_svr_setup.sh.tmpl",
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.sftpplus-svr_puppet_nodetype
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        EFS_ID         = aws_efs_file_system.sftpplus-enc.id
        MOUNT_POINT    = "/efs"
        LOG_GROUP      = local.sftpplus_log
    })
  }
}