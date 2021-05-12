data "cloudinit_config" "user_data" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_config.yaml.tmpl",
      {
        NODETYPE    = "sonarqube"
        DOMAIN_NAME = var.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/sonar-config.sh.tmpl", 
      {
        ENVIRONMENT     = var.environment
        NODETYPE        = "sonarqube"
        KMS_KEY         = var.kms_key
        AWS_ACCOUNT_ID  = var.aws_account_id
        EBS_VOLUME_ID   = aws_ebs_volume.sonarqube.id
        EBS_DEVICE_NAME = "/dev/xvdg"
        AWS_REGION      = var.region
      })
  }
}
