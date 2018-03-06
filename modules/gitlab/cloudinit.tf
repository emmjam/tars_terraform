data "template_file" "os_config" {
  template = "${file("${path.module}/templates/cloud_init_setup.yaml.tmpl")}"

  vars {
    domain_name = "${var.domain_name}"
  }
}

# data "aws_elasticache_cluster" "gitlab" {
#   cluster_id = "${format(
#     "%s-%s-%s%s",
#     var.project,
#     var.environment,
#     var.component,
#     var.name,
#   )}"
# }

data "template_file" "gitlab_config" {
  template = "${file("${path.module}/templates/gitlab_setup.sh.tmpl")}"

  vars {
    ebs_volume_id   = "${aws_ebs_volume.gitlab.id}"
    ebs_device_name = "${var.ebs_device_name}"
    aws_region      = "${data.aws_region.current.name}"
    db_endpoint     = "${aws_route53_record.db.fqdn}"
    redis_endpoint  = "${var.redis_endpoint}"
#    redis_endpoint  = "${data.aws_elasticache_cluster.gitlab.cluster_address}"
    external_url    = "${var.elb_public_external_address}"
  }
}

data "template_cloudinit_config" "gitlab" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.os_config.rendered}"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.gitlab_config.rendered}"
  }
}
