data "template_file" "os_config" {
  template = file("${path.module}/templates/cloud_init_setup.yaml.tmpl")

  vars = {
    DOMAIN_NAME = var.domain_name
  }
}

# data "aws_elasticache_cluster" "gitlab" {
#   cluster_id = "${format(
#     "%s-%s-%s%s",
#     var.project,
#     var.environment,
#     var.component,
#     var.name,
#   )}"
# }

data "template_file" "gitlab_config" {
  template = file("${path.module}/templates/gitlab_setup.sh.tmpl")

  vars = {
    EBS_VOLUME_ID   = aws_ebs_volume.gitlab.id
    EBS_DEVICE_NAME = var.ebs_device_name
    AWS_REGION      = data.aws_region.current.name
    DB_ENDPOINT     = aws_route53_record.db.fqdn
    REDIS_ENDPOINT  = var.redis_endpoint
    # REDIS_ENDPOINT  = aws_elasticache_replication_group.gitlab.configuration_endpoint_address
    EXTERNAL_URL = var.elb_public_external_address
  }
}

data "template_cloudinit_config" "gitlab" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.os_config.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.gitlab_config.rendered
  }
}

