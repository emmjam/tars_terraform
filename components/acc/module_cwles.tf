module "cwles" {
  source = "../../modules/cwles"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  aws_account_id    = "${var.aws_account_id}"
  es_cidr_whitelist = "${var.whitelist}"

  curator_max_age = "${var.cwles_curator_max_age}"

  data_instance_type    = "${var.cwles_data_instance_type}"
  data_instance_count   = "${var.cwles_data_instance_count}"
  data_volume_size      = "${var.cwles_data_volume_size}"
  master_instance_type  = "${var.cwles_master_instance_type}"
  master_instance_count = "${var.cwles_master_instance_count}"
}
