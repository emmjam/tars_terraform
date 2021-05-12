data "cloudinit_config" "nexus" {
  gzip          = true
  base64_encode = true

  # Nexus-specific template EFS
  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/cloudinit_config_efs_mount.sh.tmpl", 
      {
        AWS_REGION  = var.aws_region
        EFS_ID      = aws_efs_file_system.nexus.id
        MOUNT_POINT = "/opt/sonatype-work/nexus3"
      })
  }

  # Nexus-specific template HOSTNAME
  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_config_hostname_microservice.yaml.tmpl", 
      {
        NODETYPE        = "nexus"
        VPC_DOMAIN_NAME = local.vpc_domain_name
      })
  }

  # Nexus-specific template CUSTOM FACTOR
  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_config_facter_custom.yaml.tmpl", 
      {
        AWS_ACCOUNT_ID = var.aws_account_id
        AWS_REGION     = var.aws_region
        COMPONENT      = var.component
        ENVIRONMENT    = var.environment
        NODETYPE       = "nexus"
        PROJECT        = var.project
      })
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  # Account-specific template EYAML
  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_config_eyaml.yaml.tmpl", 
      {
        AWS_REGION = var.aws_region
        KMS_KEY_ID = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
      })
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  # Generic facts template GENERIC
  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_config_facter_generic.yaml.tmpl",
      {
        AWS_ACCOUNT_ALIAS = var.aws_account_alias
        AWS_ACCOUNT_ID    = var.aws_account_id
        AWS_REGION        = var.aws_region
        # BRANCH                  = "${var.puppet_branch}"
        COMPONENT               = var.component
        ENVIRONMENT             = var.environment
        GROUP                   = var.environment
        PROJECT                 = var.project
        PUBLIC_ROOT_DOMAIN_NAME = var.private_domain_name
        ROOT_DOMAIN_NAME        = local.vpc_domain_name
      })
    merge_type   = "list(append)+dict(recurse_array)+str()"
  }

  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/files/cloudinit_bootstrap_microservice.sh")
  }

}
