data "cloudinit_config" "gitlab" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloud_init_setup.yaml.tmpl", 
      {
        DOMAIN_NAME = var.domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/gitlab_setup.sh.tmpl", 
      {
        EBS_VOLUME_ID   = aws_ebs_volume.gitlab.id
        EBS_DEVICE_NAME = var.ebs_device_name
        AWS_REGION      = data.aws_region.current.name
        DB_ENDPOINT     = aws_route53_record.db.fqdn
        REDIS_ENDPOINT  = var.redis_endpoint
        # REDIS_ENDPOINT  = aws_elasticache_replication_group.gitlab.configuration_endpoint_address
        EXTERNAL_URL = var.elb_public_external_address
      })
  }
}