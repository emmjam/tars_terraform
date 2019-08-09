data "template_file" "os_config" {
  template = "${file("${path.module}/templates/cloudinit_config.yaml.tmpl")}"
  vars {
    NODETYPE       = "sonarqube"
    DOMAIN_NAME = "${var.vpc_domain_name}"
  }
}

data "template_file" "sonar_config" {
  template = "${file("${path.module}/templates/sonar-config.sh.tmpl")}"

  # Set puppet factors
  vars {
    ENVIRONMENT    = "${var.environment}"
    NODETYPE       = "sonarqube"
    KMS_KEY        = "${var.kms_key}"
    AWS_ACCOUNT_ID = "${var.aws_account_id}"
    EBS_VOLUME_ID   = "${aws_ebs_volume.sonarqube.id}"
    EBS_DEVICE_NAME = "/dev/xvdg"
    AWS_REGION      = "${var.region}"
  }
}

data "template_cloudinit_config" "user_data" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.os_config.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.sonar_config.rendered}"
  }
}
