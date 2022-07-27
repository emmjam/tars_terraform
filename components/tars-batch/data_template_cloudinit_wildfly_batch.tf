data "cloudinit_config" "wildfly-batch" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "tars-batch"
        DOMAIN_NAME = local.trunc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/wildfly_batch_setup.sh.tmpl",
      {
        ENVIRONMENT      = var.environment
        NODETYPE         = var.wildfly-batch_puppet_nodetype
        AWS_ACCOUNT_ID   = var.aws_account_id
        PRIVATE_DOMAIN   = var.private_domain_name
        KMS_KEY          = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        EFS_ID           = aws_efs_file_system.batch.id
        MOUNT_POINT      = "/efs_orig"
        EFS_ENC_ID      = aws_efs_file_system.batch-enc.id
        MOUNT_POINT_ENC = "/efs"
        DVSA_DNS_SERVERS = join(",", var.dvsa_dns_servers)
        SEARCH_SUFFIX    = local.vpc_domain_name
        LOG_GROUP        = local.tars_batch_log
    })
  }
}
