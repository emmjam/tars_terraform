data "cloudinit_config" "prometheus" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "prometheus"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/prometheus_setup.sh.tmpl", 
      {
        NODETYPE       = "prometheus"
        ENVIRONMENT    = var.environment
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        AWS_REGION     = var.aws_region
        EFS_ID         = aws_efs_file_system.prometheus.id
        MOUNT_POINT    = "/var/lib/prometheus"
        LOG_GROUP      = local.prometheus_log
      })
  }
}