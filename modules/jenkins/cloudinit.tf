data "cloudinit_config" "jenkins_blue" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloud_init_setup.yaml.tmpl",
      {
        DOMAIN_NAME = var.domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/jenkins_blue_setup.sh.tmpl",
      {
        JENKINS_BLUE_VERSION = var.jenkins_blue_version
        EBS_VOLUME_ID        = aws_ebs_volume.jenkins.id
        EBS_DEVICE_NAME      = var.ebs_device_name
        AWS_REGION           = data.aws_region.current.name
    })
  }
}

data "cloudinit_config" "jenkins_green" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloud_init_setup.yaml.tmpl",
      {
        DOMAIN_NAME = var.domain_name
    })
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/jenkins_green_setup.sh.tmpl",
      {
        JENKINS_GREEN_VERSION = var.jenkins_green_version
    })
  }
}
