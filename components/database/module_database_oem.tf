module "db_oem" {
  source = "../../modules/database"

  name               = "${var.oem_db_name}"
  subnets_cidrs      = "${var.rds_oem_subnets_cidrs}"
  environment        = "${var.environment}"
  rds_db_name        = "${var.oem_db_name}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  project            = "${var.project}"
  component          = "${var.component}"

  vpc_id               = "${aws_vpc.vpc.id}"
  zone_id              = "${aws_route53_zone.vpc.id}"
  subnets_route_tables = ["${aws_route_table.public.id}"]
  additional_sg_ids    = ["${aws_security_group.oem.id}"]
  public               = "true"

  s3_bucketlogs_bucket_id = "${aws_s3_bucket.bucketlogs.id}"
  aws_account_id          = "${var.aws_account_id}"

  rds_storage_type            = "gp2"
  rds_allocated_storage       = "20"
  rds_engine                  = "oracle-se2"
  rds_engine_version          = "12.1"
  rds_instance_class          = "db.t2.medium"
  rds_multi_az                = false
  rds_username                = "admin"
  rds_password                = "QueidouSh5ieghelaidooGhu"
  rds_skip_final_snapshot     = true
  rds_backup_retention_period = "0"
  rds_backup_window           = "01:00-02:00"
  rds_maintenance_window      = "Sun:03:00-Sun:06:00"
  rds_db_og_id                = "${aws_db_option_group.oem.id}"
  rds_db_pg_id                = "${aws_db_parameter_group.oem.id}"
  license_model               = "license-included"

  default_tags = "${merge(
    var.default_tags,
    map("Component", var.component)
  )}"
}
