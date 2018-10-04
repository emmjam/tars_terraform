# Create the cloud init template for common config
data "template_file" "wildfly-batch-common" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "tars-batch"
    domain_name = "${local.vpc_domain_name}"
  }
}

# Create the cloud init template for the wildfly batch server
data "template_file" "wildfly-batch-config" {
  template = "${file("${path.module}/templates/wildfly_batch_setup.sh.tmpl")}"

  # Set puppet factors
  vars {
    environment        = "${var.environment}"
    puppet_environment = "${var.puppet_environment}"
    nodetype           = "${var.wildfly-batch_puppet_nodetype}"
    kms_key            = "${var.wildfly-batch_puppet_kms_key}"
    EFS_ID             = "${aws_efs_file_system.batch.id}"
    MOUNT_POINT        = "/efs"
    aws_account_id     = "${var.aws_account_id}"
    dvsa_dns_servers   = "${join(",", var.dvsa_dns_servers)}"
    search_suffix      = "${local.vpc_domain_name}"
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
