data "template_file" "grafana" {
  template = file("${path.module}/templates/cloudinit_common.yaml.tmpl")

  vars = {
    NODETYPE    = "grafana"
    DOMAIN_NAME = local.vpc_domain_name
  }
}

data "template_file" "grafana_config" {
  template = file("${path.module}/templates/grafana_setup.sh.tmpl")

  vars = {
    NODETYPE       = "grafana"
    ENVIRONMENT    = var.environment
    AWS_ACCOUNT_ID = var.aws_account_id
    AWS_REGION     = var.aws_region
  }
}

data "template_cloudinit_config" "grafana" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.grafana.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.grafana_config.rendered
  }
}

