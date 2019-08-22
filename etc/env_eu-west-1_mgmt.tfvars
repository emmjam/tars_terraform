##########
# GENERAL
##############################################################################
project = "tars"

environment = "mgmt"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "mgmt"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "mgmt"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "mgmt"
    "propagate_at_launch" = "true"
  }
]

private_domain_name = "tars.dvsa.aws"

##########
# ACCOUNT
###############################################################################
aws_account_alias = "tarsmgmt"

public_domain_name = "tars.dvsacloud.uk"

# This is new. This is to start the long hike to having
# one consistent domain name structure across the project.
# This will be used by the ctrl component initially in order
# to have a private hosted zone local to the VPC that matches
# the appropriate structure. This variable can then be used
# to expand the single structure wider as different components
# become malleable. One day, all groups may share one single
# domain root and make use of it for all domain purposes,
# public *and* private
root_domain_name = "tars.dvsacloud.uk"

# For delegation to prod
prod_public_domain_name = "prod.tars.dvsacloud.uk"

subdomains_name_servers = {
  nonprod = "ns-144.awsdns-18.com,ns-1293.awsdns-33.org,ns-619.awsdns-13.net,ns-1979.awsdns-55.co.uk"
}

# For delgetion to prod
prod_subdomains_name_servers = {
  prod = "ns-426.awsdns-53.com,ns-1049.awsdns-03.org,ns-2041.awsdns-63.co.uk,ns-611.awsdns-12.net"
}

# ACM Certname
cert_name = "*"

##########################################
# Guardduty
##########################################

guardduty_master_enabled = "1"
guardduty_member_enabled = "0"

guardduty_member_list = [
  { # tarsnonprod
    account_id = "652856684323"
    email      = "TARSNonProdAWS@dvsa.gov.uk"
  },
  {
    account_id = "246976497890"
    email      = "TARSProdAWS@dvsa.gov.uk"
  },
]


###########################################
# Peering
###########################################

ctrl_peers_xacct = [
  {
    vpc_id     = "vpc-9f2ba7f9"   # tarsnonprod/ctrl
    cidr_block = "10.167.60.0/22"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-01552f67"   # tarsprod/ctrl
    cidr_block = "10.167.56.0/22"
    account_id = "246976497890"
  },
]

# Peers created by the ctrl component, in the same AWS account
ctrl_peers_local = [
  {
    vpc_id     = "vpc-ff970799"   # tarsmgmt/ctrl
    cidr_block = "10.167.64.0/22"
    account_id = "645711882182"
  },
]

base_peers_local = []

# Peers created by the base component, in a different AWS account
base_peers_xacct = [
  {
    vpc_id     = "vpc-91eab8f7"  # tarsnonprod/opsdev
    cidr_block = "10.167.0.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-a3fdafc5"  # tarsnonprod/dev01
    cidr_block = "10.167.24.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-10ecbe76"  # tarsnonprod/sit01
    cidr_block = "10.167.16.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-4be8ba2d"   # tarsnonprod/uat01
    cidr_block = "10.167.8.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-301d4056"   # tarsnonprod/perf01
    cidr_block = "10.167.32.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-1c88d57a"   # tarsprod/prod
    cidr_block = "10.167.128.0/21"
    account_id = "246976497890"
  },
  {
    vpc_id     = "vpc-0b238d4af5302abf1"   # tarsprod/prep
    cidr_block = "10.167.136.0/21"
    account_id = "246976497890"
  },
  {
    vpc_id     = "vpc-0d5b870a03ca18430"   # tarsnonprod/train
    cidr_block = "10.167.144.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-07114e08eddc0332a"  # tarsnonprod/dev02
    cidr_block = "10.167.40.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-08ba72bcbd38b6746"  # tarsnonprod/perf02
    cidr_block = "10.167.72.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-04a94878b58a60387"  # tarsnonprod/uat02
    cidr_block = "10.167.48.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-0e7a1dbf9dbe564f3"  # tarsnonprod/sit02
    cidr_block = "10.167.80.0/21"
    account_id = "652856684323"
  },
  {
    vpc_id     = "vpc-05c69ca21e975e5b1"  # tarsnonprod/uat03
    cidr_block = "10.167.88.0/21"
    account_id = "652856684323"
  },
]

### CWLES

cwles_curator_max_age = "30"
cwles_data_instance_type    = "m4.large.elasticsearch"
cwles_data_instance_count   = "2"
cwles_data_volume_size      = "512"
cwles_master_instance_type  = "t2.small.elasticsearch"
cwles_master_instance_count = "2"


##
# Yum Bucket Access Delegation
##
s3_yum_ro_principals = [
  "652856684323", # tarsnonprod
  "645711882182", # tarsmgmt - Redundant, but here for completeness
  "246976497890", # tarslive
]


########
# MGMT
###############################################################################
vpc_cidr = "10.200.0.0/16"

nat_subnets_cidr = [
  "10.200.1.0/28",
  "10.200.1.16/28",
  "10.200.1.32/28",
]

natgw_subnets_cidr = [
  "10.200.1.48/28",
  "10.200.1.64/28",
  "10.200.1.80/28",
]

# TODO: smarts: Move AMI IDs to versions file
## bastion
bastion_instance_type        = "t2.micro"
bastion_ami_build_id         = "587"
bastion_asg_min_size         = 0
bastion_asg_max_size         = 3
bastion_scaledown_desired    = 1
bastion_scaledown_recurrence = "00 19 * * 1-5"
bastion_scaleup_desired      = 1
bastion_scaleup_recurrence   = "00 07 * * 1-5"

# TODO: smarts: Move AMI IDs to versions file
## Grafana
grafana_instance_type        = "t2.micro"
grafana_ami_build_id         = "565"
grafana_asg_min_size         = 0
grafana_asg_max_size         = 0
grafana_scaledown_desired    = 0
grafana_scaledown_recurrence = "00 19 * * 1-5"
grafana_scaleup_desired      = 0
grafana_scaleup_recurrence   = "00 07 * * 1-5"

#Due to there being no wildcard cert in prod this is used.
grafana_cert_name = "*"

# TODO: smarts: Move AMI IDs to versions file
## jenkinsctrl
jenkinsctrl_instance_type        = "m5d.large"
jenkinsctrl_ami_build_id         = "468"
jenkinsctrl_executors            = 20
jenkinsctrl_asg_min_size         = 0
jenkinsctrl_asg_max_size         = 3
jenkinsctrl_scaledown_desired    = 1
jenkinsctrl_scaledown_recurrence = "00 19 * * 1-5"
jenkinsctrl_scaleup_desired      = 1
jenkinsctrl_scaleup_recurrence   = "15 07 * * 1-5"

## alb public
alb_public_subnets_cidrs = [
  "10.200.1.144/28",
  "10.200.1.160/28",
  "10.200.1.176/28",
]

## sonarqube
sonarqube = {
  sq_asg_size_min             = 1
  sq_asg_size_desired         = 1
  sq_asg_size_max             = 1
  sq_instance_type            = "t2.medium"
  sq_subnets_newbits          = "8"
  sq_subnets_netnum_root      = "10"
  rds_pg_max_allowed_packet   = "104857600"
  rds_storage_type            = "gp2"
  rds_allocated_storage       = "20"
  rds_engine                  = "postgres"
  rds_engine_version          = "10.9"
  rds_pg_family               = "postgres10"
  rds_instance_class          = "db.t2.medium"
  rds_multi_az                = false
  rds_username                = "sonarQubeAdmin"
  rds_password                = "sonarQubeAdmin"
  rds_skip_final_snapshot     = false
  rds_backup_retention_period = 7
  rds_backup_window           = "01:00-02:00"
  rds_maintenance_window      = "Sun:03:00-Sun:06:00"
  rds_subnets_newbits         = "8"
  rds_subnets_netnum_root     = "13"

}


## gitlab
gitlab_instance_type        = "m4.large"
gitlab_ami_build_id         = "2"
gitlab_asg_min_size         = 0
gitlab_asg_max_size         = 1
gitlab_ebs_volume_type      = "gp2"
gitlab_ebs_volume_size      = 20
gitlab_scaledown_desired    = 0
gitlab_scaledown_recurrence = "00 19 * * 1-5"
gitlab_scaleup_desired      = 1
gitlab_scaleup_recurrence   = "00 07 * * 1-5"

gitlab_subnets_cidrs = ["10.200.2.0/28"]

gitlab_elb_public_public_port     = 443
gitlab_elb_public_public_protocol = "HTTPS"

gitlab_elb_subnets_cidrs = ["10.200.2.16/28"]

gitlab_elb_private_subnets_cidrs = ["10.200.2.128/28"]

gitlab_db_db_name                 = "gitlab"
gitlab_db_allocated_storage       = "20"
gitlab_db_storage_type            = "gp2"
gitlab_db_engine_version          = "9.6.11"
gitlab_db_instance_class          = "db.t2.medium"
gitlab_db_multi_az                = true
gitlab_db_username                = "gitLabAdmin"
gitlab_db_password                = "gitLabAdmin"
gitlab_db_backup_retention_period = 14
gitlab_db_backup_window           = "01:00-02:00"
gitlab_db_maintenance_window      = "Sun:03:00-Sun:06:00"
gitlab_db_skip_final_snapshot     = false
gitlab_db_pg_family               = "postgres9.6"

gitlab_db_subnets_cidrs = [
  "10.200.2.32/28",
  "10.200.2.48/28",
  "10.200.2.64/28",
]

gitlab_redis_engine_version           = "3.2.4"
gitlab_redis_parameter_group_name     = "default.redis3.2"
gitlab_redis_node_type                = "cache.m3.medium"
gitlab_redis_maintenance_window       = "sun:04:00-sun:07:00"
gitlab_redis_snapshot_window          = "00:00-03:00"
gitlab_redis_snapshot_retention_limit = 0                                                           # backups turned off
gitlab_redis_endpoint_address         = "rsp-mgmt-mgmt-gitlab.ow39bf.0001.euw1.cache.amazonaws.com" # endpoint address is not revealable yet


gitlab_redis_subnets_cidrs = [
  "10.200.2.80/28",
  "10.200.2.96/28",
  "10.200.2.112/28",
]

## jenkins
jenkins_instance_type        = "m4.large"
jenkins_ami_build_id         = "43"
jenkins_asg_min_size         = 0
jenkins_asg_max_size         = 1
jenkins_ebs_volume_type      = "gp2"
jenkins_ebs_volume_size      = 40
jenkins_blue_nodes_number    = 1
jenkins_scaledown_desired    = 1
jenkins_scaledown_recurrence = "00 19 * * 1-5"
jenkins_scaleup_desired      = 1
jenkins_scaleup_recurrence   = "00 07 * * 1-5"

jenkins_blue_subnets_cidrs = ["10.200.3.0/28"]

jenkins_blue_version = "2.89.3-1.1"

jenkins_elb_subnets_cidrs = ["10.200.3.32/28"]

## jenkinsnode
#jenkinsnode = {
#  instance_type        = "m4.large"
#  ami_build_id         = "32"
 # executors            = 5
 ## asg_min_size         = 0
 # asg_max_size         = 3
 # scaledown_desired    = 0
#  scaledown_recurrence = "00 19 * * 1-5"
#  scaleup_desired      = 1
#  scaleup_recurrence   = "15 07 * * 1-5"
#}

jenkinsnode_subnets_cidrs = [
  "10.200.3.48/28",
  "10.200.3.64/28",
  "10.200.3.80/28",
]


# EBS backup lambda
ebs_snapshot_is_enabled                       = true
ebs_snapshot_s3_key                           = "lambda/ebs_snapshot_lambda.py.zip"
ebs_snapshot_memory_size                      = 128
ebs_snapshot_timeout                          = 60
ebs_snapshot_publish                          = true
ebs_snapshot_cloudwatch_log_retention_in_days = 14
ebs_snapshot_cw_rule_schedule_expression      = "cron(00 01 ? * 3-7 *)"
ebs_snapshot_cw_metric_log_error_pattern      = "\"[ERROR]\" \"Snapshot backup Lambda failed\""
ebs_snapshot_cw_alarm_namespace               = "ebs-snapshot-lambda"


# EBS cleanup Lambda
ebs_snapshot_cleanup_is_enabled                       = true
ebs_snapshot_cleanup_s3_key                           = "lambda/ebs_cleanup_lambda.py.zip"
ebs_snapshot_cleanup_memory_size                      = 128
ebs_snapshot_cleanup_timeout                          = 120
ebs_snapshot_cleanup_publish                          = true
ebs_snapshot_cleanup_cloudwatch_log_retention_in_days = 14
ebs_snapshot_cleanup_cw_rule_schedule_expression      = "cron(00 03 ? * 3-7 *)"
ebs_snapshot_cleanup_cw_metric_log_error_pattern      = "\"[ERROR]\" \"Snapshot Cleanup Lambda failed\""
ebs_snapshot_cleanup_cw_alarm_namespace               = "ebs-snapshot-cleanup-lambda"
ebs_snapshot_cleanup_min_num_of_snapshots_to_retain   = 7
ebs_snapshot_cleanup_min_retention_days               = 7

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# ECR
##

ecr_repository_ro_principals = [
  "246976497890", # tarsprod
  "645711882182", # tarsmgmt
  "652856684323", # tarsnonprod
]

##
# Nexus
##

nexus_config = {
  asg_min       = "0"
  asg_max       = "1"
  asg_desired   = "1"
  instance_type = "t3.medium"
  listen_port   = "8081"
  nexus_ami_build_id = "484"
}

nexus_subnets_cidrs = [
  "10.200.4.0/28",
  "10.200.4.16/28",
  "10.200.4.32/28",
]

nexus_efs_subnets_cidrs = [
  "10.200.4.48/28",
  "10.200.4.64/28",
  "10.200.4.80/28",
]


##
# LDAP
##

ldap_config = {
  asg_min       = "0"
  asg_max       = "1"
  asg_desired   = "1"
  instance_type = "t3.medium"

  # Wild card while developing to pull latest AMI
  ami_build_id = "*"
}

ldap_subnets_cidrs = [
  "10.200.4.96/28",
  "10.200.4.112/28",
  "10.200.4.128/28",
]

ldap_elb_subnets_cidrs = [
  "10.200.4.144/28",
  "10.200.4.160/28",
  "10.200.4.176/28",
]
