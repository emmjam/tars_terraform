data "cloudinit_config" "wildfly-mock" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "mock"
        DOMAIN_NAME = "${var.environment}.${var.private_domain_name}"
      })
  }

  part {
    content_type = "text/x-shellscript"
    content      = templatefile("${path.module}/templates/wildfly_mock_setup.sh.tmpl", 
      {
        ENVIRONMENT    = var.environment
        NODETYPE       = var.wildfly-mock_puppet_nodetype
        KMS_KEY        = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
        AWS_ACCOUNT_ID = var.aws_account_id
      })
  }
}