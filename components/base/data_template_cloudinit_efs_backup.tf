data "template_file" "efs_backup" {
  template = "${file("${path.module}/templates/cloudinit_common.yaml.tmpl")}"

  vars {
    NODETYPE    = "efs-backup"
    DOMAIN_NAME = "${local.vpc_domain_name}"
  }
}

data "template_file" "efs_backup_config" {
  template = "${file("${path.module}/templates/efs_backup_setup.sh.tmpl")}"

  vars {
    NODETYPE       = "efs-backup"
    ENVIRONMENT    = "${var.environment}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    AWS_REGION     = "${var.aws_region}"
    BACKUP_BUCKET  = "${aws_s3_bucket.efs_backups.bucket}"
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
