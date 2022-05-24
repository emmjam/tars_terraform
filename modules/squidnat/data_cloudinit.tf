################################################################################
#
# CloudInit data
#
################################################################################

data "cloudinit_config" "squidnat" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_config_squidnat.yaml.tmpl",
      {
        NODETYPE         = var.module
        ENVIRONMENT      = var.environment
        ROOT_DOMAIN_NAME = var.root_domain_name
        SQUID_WHITELIST_RENDERED = templatefile("${path.module}/templates/squid_whitelist_file.tmpl",
          {
            SQUID_WHITELIST_CIDRS = join("\n", var.whitelist_cidrs)
        })
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/squidnat_setup.sh.tmpl",
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = "squidnat"
        KMS_KEY        = var.hiera_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
        REGION         = var.region
        LOG_GROUP      = local.squidnat_log
    })
  }
}


