data "template_file" "jenkinsctrl" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "jenkinsctrl"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "jenkinsctrl_config" {
  template = "${file("${path.module}/templates/jenkinsnode_setup.sh.tmpl")}"

  vars {
    MASTER_URL    = "jenkins.mgmt.mgmt.tars.dvsa.aws"                        # TODO: use remote state
    ACCOUNT_ALIAS = "${data.terraform_remote_state.acc.account_alias}"
    EXECUTORS     = "${var.jenkinsctrl_executors}"
  }
}

data "template_cloudinit_config" "jenkinsctrl" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.jenkinsctrl.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkinsctrl_config.rendered}"
  }
}
