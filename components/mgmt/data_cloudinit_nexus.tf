data "template_file" "cloudinit_config_facter_custom_nexus" {
  template = file(
    "${path.module}/templates/cloudinit_config_facter_custom.yaml.tmpl",
  )

  vars = {
    AWS_ACCOUNT_ID = var.aws_account_id
    AWS_REGION     = var.aws_region
    COMPONENT      = var.component
    ENVIRONMENT    = var.environment
    NODETYPE       = "nexus"
    PROJECT        = var.project
  }
}

data "template_file" "cloudinit_config_hostname_nexus" {
  template = file(
    "${path.module}/templates/cloudinit_config_hostname_microservice.yaml.tmpl",
  )

  vars = {
    NODETYPE        = "nexus"
    VPC_DOMAIN_NAME = local.vpc_domain_name
  }
}

data "template_file" "cloudinit_config_efs_mount" {
  template = file(
    "${path.module}/templates/cloudinit_config_efs_mount.sh.tmpl",
  )

  vars = {
    AWS_REGION  = var.aws_region
    EFS_ID      = aws_efs_file_system.nexus.id
    MOUNT_POINT = "/opt/sonatype-work/nexus3"
  }
}

# The nexus cloud-init config as rendered to be user-data input
data "template_cloudinit_config" "nexus" {
  gzip          = true
  base64_encode = true

  # Nexus-specific template
  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.cloudinit_config_efs_mount.rendered
  }

  # Nexus-specific template
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloudinit_config_hostname_nexus.rendered
  }

  # Nexus-specific template
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloudinit_config_facter_custom_nexus.rendered
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  # Account-specific template
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloudinit_config_eyaml.rendered
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  ## Branch-specific template
  #part {
  #  content_type = "text/cloud-config"
  #  content      = "${data.template_file.cloudinit_config_yum_puppet.rendered}"
  #  merge_type   = "list(append)+dict(recurse_array)+str()"
  #}

  # Generic facts template
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloudinit_config_facter_generic.rendered
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  # Generic bootstrap script
  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/files/cloudinit_bootstrap_microservice.sh")
  }
}

