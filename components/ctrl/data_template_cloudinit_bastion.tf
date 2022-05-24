data "cloudinit_config" "bastion" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "bastion"
        DOMAIN_NAME = local.vpc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/bastion_setup.sh.tmpl",
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = "bastion"
        AWS_ACCOUNT_ID = var.aws_account_id
    })
  }
}