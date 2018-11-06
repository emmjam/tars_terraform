data "template_file" "cloudinit_config_facter_generic" {
  template = "${file("${path.module}/templates/cloudinit_config_facter_generic.yaml.tmpl")}"

  vars {
    AWS_ACCOUNT_ALIAS       = "${var.aws_account_alias}"
    AWS_ACCOUNT_ID          = "${var.aws_account_id}"
    AWS_REGION              = "${var.aws_region}"
    # BRANCH                  = "${var.puppet_branch}"
    COMPONENT               = "${var.component}"
    ENVIRONMENT             = "${var.environment}"
    GROUP                   = "${var.environment}"
    PROJECT                 = "${var.project}"
    PUBLIC_ROOT_DOMAIN_NAME = "${var.private_domain_name}"
    ROOT_DOMAIN_NAME        = "${local.vpc_domain_name}"
  }
}
