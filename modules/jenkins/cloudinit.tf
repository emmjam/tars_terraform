data "template_file" "os_config" {
  template = "${file("${path.module}/templates/cloud_init_setup.yaml.tmpl")}"

  vars {
    DOMAIN_NAME = "${var.domain_name}"
  }
}

data "template_file" "jenkins_blue_config" {
  template = "${file("${path.module}/templates/jenkins_blue_setup.sh.tmpl")}"

  vars {
    JENKINS_BLUE_VERSION = "${var.jenkins_blue_version}"
    EBS_VOLUME_ID        = "${aws_ebs_volume.jenkins.id}"
    EBS_DEVICE_NAME      = "${var.ebs_device_name}"
    AWS_REGION           = "${data.aws_region.current.name}"
  }
}

data "template_file" "jenkins_green_config" {
  template = "${file("${path.module}/templates/jenkins_green_setup.sh.tmpl")}"

  vars {
    JENKINS_GREEN_VERSION = "${var.jenkins_green_version}"
  }
}

data "template_cloudinit_config" "jenkins_blue" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.os_config.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkins_blue_config.rendered}"
  }
}

data "template_cloudinit_config" "jenkins_green" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.os_config.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkins_green_config.rendered}"
  }
}
