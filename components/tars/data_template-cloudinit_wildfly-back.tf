data "template_file" "wildfly-back-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "wildlfy-back"
    domain_name = "${var.environment}.${var.private_domain_name}"
  }
}

data "template_file" "wildfly-back-config" {
  template = "${file("${path.module}/templates/wildfly_back_setup.sh.tmpl")}"

  # vars {
    # master_url    = "${module.jenkins.elb_fqdn}"
    # account_alias = "${data.terraform_remote_state.acc.account_alias}"
    # executors     = "${lookup(var.jenkinsnode,"executors")}"
  # }
}

data "template_cloudinit_config" "wildfly-back" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.wildfly-back-common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wildfly-back-config.rendered}"
  }
}
