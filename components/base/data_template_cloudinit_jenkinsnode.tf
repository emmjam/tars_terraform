# Create the common cloud init template
data "template_file" "jenkinsnode" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "jenkinsnode"
    domain_name = "${local.vpc_domain_name}"
  }
}

# Create the jenkinsnode specific cloudinit script
data "template_file" "jenkinsnode_config" {
  template = "${file("${path.module}/templates/jenkinsnode_setup.sh.tmpl")}"

  vars {
    master_url    = "jenkins.mgmt.mgmt.tars.dvsa.aws"                        # TODO: use remote state
    # account_alias = "${data.terraform_remote_state.acc.account_alias}"
    account_alias = "${var.environment}"
    executors     = "${var.jenkinsnode_executors}"
  }
}

# Render the templates ready for the Launch Config
data "template_cloudinit_config" "jenkinsnode" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.jenkinsnode.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkinsnode_config.rendered}"
  }
}
