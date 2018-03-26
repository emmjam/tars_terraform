
account_environment    = "nonprod"


##
# RDS
##

# TARSDB
tars_rds_username = "tarsdevadmin"
tars_rds_password = "password"

# TARSDB
tars_rds_allocated_storage   = "20" # 20 Gigabyte - was 1500GB
tars_rds_storage_type        = "gp2"
tars_rds_engine              = "oracle-se2"
tars_rds_engine_version      = "12.1.0.2.v11"
tars_rds_instance_class      = "db.t2.micro" # was "db.m4.4xlarge"
tars_rds_port                = "1521"
tars_rds_public              = "false"
tars_rds_multi_az            = "false" # it takes an age to build if true
tars_rds_backup_retention    = "0"
tars_rds_backup_window       = "02:38-03:08"
tars_rds_maint_window        = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately   = "true"
tars_rds_license_model       = "license-included"
tars_rds_snapshot            = "tars-testdb-210218"


###############################################################################
# CONTROL
###############################################################################
ctrl_vpc_cidr = "10.167.0.0/26"

ctrl_nat_subnets_cidrs = [
  "10.167.0.0/28",
]

mgmt = {
  aws_account_id         = "645711882182"
  aws_region             = "eu-west-1"
  project                = "tars"
  environment            = "mgmt"
  component              = "mgmt"
  vpc_id                 = "vpc-e303d285"  # TODO: use remote state
  vpc_cidr_block         = "10.200.0.0/16"   # TODO: use remote state
  tf_state_bucket_prefix = "tars-terraformscaffold"   # TODO: use remote state
  jenkins_elb_subnet     = "10.200.3.32/28"  # TODO: use remote state
  gitlab_subnet          = "10.200.2.128/28" # TODO: use remote state
}

# TODO: use remote state
mgmt_bastion_subnets = [
  "10.200.1.96/28",
  "10.200.1.112/28",
  "10.200.1.128/28",
]

## jenkinsnode
jenkinsnode = {
  instance_type        = "m4.large"
  ami_build_id         = "1"
  executors            = 5
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "15 07 * * 1-5"
}

jenkinsnode_subnets_cidrs = [
  "10.167.0.16/28",
  "10.167.0.32/28",
  "10.167.0.64/28",
]
ops_team_email = "mark.thompson@bjss.com"
