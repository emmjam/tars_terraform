data "template_file" "jenkinsctrl" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "jenkinsctrl"
    domain_name = "${var.component}.${var.environment}.${var.private_domain_name}"
  }
}

data "template_file" "jenkinsctrl_config" {
  template = "${file("${path.module}/templates/jenkinsnode_setup.sh.tmpl")}"

  vars {
    master_url    = "jenkins.mgmt.tars.dvsa.aws"                        # TODO: use remote state
    account_alias = "${data.terraform_remote_state.acc.account_alias}"
    executors     = "${lookup(var.jenkinsctrl,"executors")}"
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
