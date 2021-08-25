data "cloudinit_config" "grafana" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "grafana"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/grafana_setup.sh.tmpl", 
      {
        NODETYPE       = "grafana"
        PRIVATE_DOMAIN = var.private_domain_name
        ENVIRONMENT    = var.environment
        AWS_ACCOUNT_ID = var.aws_account_id
        AWS_REGION     = var.aws_region
      })
  }
}
