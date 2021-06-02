data "cloudinit_config" "oraclexe" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloudinit_common.yaml.tmpl", 
      {
        NODETYPE    = "oraclexe"
        DOMAIN_NAME = local.vpc_domain_name
      })
  }
}
