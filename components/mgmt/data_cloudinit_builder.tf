data "cloudinit_config" "builder" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "builder"
        DOMAIN_NAME = local.vpc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/jenkinsnode_setup.sh.tmpl",
      {
        MASTER_URL    = "jenkins.mgmt.mgmt.tars.dvsa.aws" # TODO: use remote state
        ACCOUNT_ALIAS = "builder"
        EXECUTORS     = var.builder_executors
    })
  }
}

