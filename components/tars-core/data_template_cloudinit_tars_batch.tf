# Create the cloud init template for common config
data "template_file" "wildfly-batch-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "tars-batch"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "wildfly-batch-config" {
  template = "${file("${path.module}/templates/wildfly_batch_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT      = "${var.environment}"
    NODETYPE         = "${var.wildfly-batch_puppet_nodetype}"
    KMS_KEY          = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
    EFS_ID           = "${aws_efs_file_system.batch.id}"
    MOUNT_POINT      = "/efs"
    AWS_ACCOUNT_ID   = "${var.aws_account_id}"
    DVSA_DNS_SERVERS = "${join(",", var.dvsa_dns_servers)}"
    SEARCH_SUFFIX    = "${local.vpc_domain_name}"
    LOG_GROUP        = "${local.tars_batch_log}"
  }
}

# Render the templates ready for the LC
data "template_cloudinit_config" "wildfly-batch" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.wildfly-batch-common.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.wildfly-batch-config.rendered}"
  }
}
