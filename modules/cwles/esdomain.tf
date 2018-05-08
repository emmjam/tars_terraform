resource "aws_elasticsearch_domain" "es" {
  domain_name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles"
  )}"

  elasticsearch_version = "6.2"

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  cluster_config {
    instance_type            = "${var.data_instance_type}" # "m3.medium.elasticsearch"
    instance_count           = "${var.data_instance_count}" # 2
    dedicated_master_enabled = true
    dedicated_master_type    = "${var.master_instance_type}" # "t2.micro.elasticsearch"
    dedicated_master_count   = "${var.master_instance_count}" # 3
    zone_awareness_enabled   = true
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = "${var.data_volume_size}" # "100"
  }

  tags {
    "Domain" = "${format(
      "%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      "cwles"
    )}"

    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
    "Component"   = "${var.component}"
    "Module"      = "cwles"
  }
}
