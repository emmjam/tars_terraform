data "template_file" "builder" {
  template = file("${path.module}/templates/cloudinit_common.yaml.tmpl")

  vars = {
    NODETYPE    = "builder"
    DOMAIN_NAME = local.vpc_domain_name
  }
}

data "template_file" "builder_config" {
  template = file("${path.module}/templates/jenkinsnode_setup.sh.tmpl")

  vars = {
    MASTER_URL    = "jenkins.mgmt.mgmt.tars.dvsa.aws" # TODO: use remote state
    ACCOUNT_ALIAS = "builder"
    EXECUTORS     = var.builder_executors
  }
}

data "template_cloudinit_config" "builder" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.builder.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.builder_config.rendered
  }
}

