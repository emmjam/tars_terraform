# Create the cloud init template for common config
data "template_file" "apache_common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "apache-routing"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "apache_config" {
  template = "${file("${path.module}/templates/apache_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    NODETYPE       = "apache-routing"
    ENVIRONMENT    = "${var.environment}"
    KMS_KEY        = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    LOG_GROUP      = "${local.apache_log}"
  }
}

data "template_cloudinit_config" "apache" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.apache_common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.apache_config.rendered}"
  }
}
