data "cloudinit_config" "jenkinsctrl" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl",
      {
        NODETYPE    = "jenkinsctrl"
        DOMAIN_NAME = local.vpc_domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/jenkinsnode_setup.sh.tmpl",
      {
        MASTER_URL    = "jenkins.mgmt.mgmt.tars.dvsa.aws" # TODO: use remote state
        ACCOUNT_ALIAS = data.terraform_remote_state.acc.outputs.account_alias
        EXECUTORS     = var.jenkinsctrl_executors
    })
  }
}

