data "template_file" "efs_backup" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    nodetype    = "efs-backup"
    domain_name = "${local.vpc_domain_name}"
  }
}

data "template_file" "efs_backup_config" {
  template = "${file("${path.module}/templates/efs_backup_setup.sh.tmpl")}"

  vars {
    nodetype            = "efs-backup"
    environment         = "${var.environment}"
    puppet_environment  = "${var.puppet_environment}"
    aws_account         = "${var.aws_account_id}"
    aws_region          = "${var.aws_region}"
    backup_bucket       = "${aws_s3_bucket.efs_backups.bucket}"
  }
}

data "template_cloudinit_config" "efs_backup" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.efs_backup.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.efs_backup_config.rendered}"
  }
}
