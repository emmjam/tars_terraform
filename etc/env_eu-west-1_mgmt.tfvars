##########
# GENERAL
##############################################################################
project     = "tars"
environment = "mgmt"
aws_region  = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "mgmt"
}

private_domain_name = "tars.dvsa.aws"

##########
# ACCOUNT
###############################################################################
aws_account_alias = "tarsmgmt"

public_domain_name = "tars.dvsacloud.uk"

subdomains_name_servers = {
  nonprod = "ns-144.awsdns-18.com,ns-1293.awsdns-33.org,ns-619.awsdns-13.net,ns-1979.awsdns-55.co.uk"
}

users = [
  "rob.hart@dvsa.gov.uk",
]

administrators = [
  "mark.thompson@bjss.com",
]

########
# MGMT
###############################################################################
vpc_cidr = "10.200.0.0/16"

nat_subnets_cidrs = [
  "10.200.1.0/28",
  "10.200.1.16/28",
  "10.200.1.32/28",
]

## bastion
bastion = {
  instance_type        = "t2.micro"
  ami_build_id         = "1"
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

bastion_elb_subnets_cidrs = [
  "10.200.1.48/28",
  "10.200.1.64/28",
  "10.200.1.80/28",
]

bastion_subnets_cidrs = [
  "10.200.1.96/28",
  "10.200.1.112/28",
  "10.200.1.128/28",
]

bastion_whitelist = [
  "77.86.30.4/32",      # BJSS VPN
#  "195.89.171.5/32",   # Kainos VPN 1
#  "195.89.171.144/32", # Kainos VPN 2
#  "91.222.71.98/32",   # Kainos GDN
]

## alb public
alb_public_subnets_cidrs = [
  "10.200.1.144/28",
  "10.200.1.160/28",
  "10.200.1.176/28",
]

## gitlab
gitlab = {
  instance_type        = "m4.large"
  ami_build_id         = "1"
  asg_min_size         = 0
  asg_max_size         = 1
  ebs_volume_type      = "gp2"
  ebs_volume_size      = 20
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

gitlab_subnets_cidrs = ["10.200.2.0/28"]

gitlab_elb_public = {
  public_port     = 443
  public_protocol = "HTTPS"
}

gitlab_elb_subnets_cidrs = ["10.200.2.16/28"]

gitlab_elb_private_subnets_cidrs = ["10.200.2.128/28"]

gitlab_db = {
  db_name                 = "gitlab"
  allocated_storage       = "20"
  storage_type            = "gp2"
  engine_version          = "9.6.3"
  instance_class          = "db.t2.medium"
  multi_az                = true
  username                = "gitLabAdmin"
  password                = "gitLabAdmin"
  backup_retention_period = 14
  backup_window           = "01:00-02:00"
  maintenance_window      = "Sun:03:00-Sun:06:00"
  skip_final_snapshot     = false
  pg_family               = "postgres9.6"
}

gitlab_db_subnets_cidrs = [
  "10.200.2.32/28",
  "10.200.2.48/28",
  "10.200.2.64/28",
]

gitlab_redis = {
  engine_version           = "3.2.4"
  parameter_group_name     = "default.redis3.2"
  node_type                = "cache.m3.medium"
  maintenance_window       = "sun:04:00-sun:07:00"
  snapshot_window          = "00:00-03:00"
  snapshot_retention_limit = 0 # backups turned off
  endpoint_address         = "rsp-mgmt-mgmt-gitlab.ow39bf.0001.euw1.cache.amazonaws.com" # endpoint address is not revealable yet
}

gitlab_redis_subnets_cidrs = [
  "10.200.2.80/28",
  "10.200.2.96/28",
  "10.200.2.112/28",
]

gitlab_whitelist = [
  "90.152.126.166/32",     # DVSA VPN??
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "77.86.30.4/32",      # BJSS VPN
]

## jenkins
jenkins = {
  instance_type        = "m4.large"
  ami_build_id         = "1"
  asg_min_size         = 0
  asg_max_size         = 1
  ebs_volume_type      = "gp2"
  ebs_volume_size      = 20
  blue_nodes_number    = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

jenkins_blue_subnets_cidrs = ["10.200.3.0/28"]
#jenkins_blue_version       = "2.73.2-1.1"
jenkins_blue_version       = "2.89.3-1.1"

jenkins_elb_subnets_cidrs = ["10.200.3.32/28"]

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
  "10.200.3.48/28",
  "10.200.3.64/28",
  "10.200.3.80/28",
]

jenkins_whitelist = [
  "90.152.126.166/32",     # DVSA VPN??
  "135.196.73.204/32",  # DVSA Notts Corp
  "213.160.121.250/32", # DVSA Notts Wifi
  "77.86.30.4/32",      # BJSS VPN
]

## ctrl
ctrl_peers = [
  { # tars NON-PROD
    account_id         = "174362052724"
    vpc_id             = "vpc-977e5df0"
    cidr_block         = "10.20.0.0/16"
    jenkinsnode_subnet = "10.20.2.0/24"
  }
]

# EBS backup lambda
ebs_snapshot = {
  is_enabled                       = true
  s3_key                           = "lambda/ebs_snapshot_lambda.py.zip"
  memory_size                      = 128
  timeout                          = 60
  publish                          = true
  cloudwatch_log_retention_in_days = 14
  cw_rule_schedule_expression      = "cron(00 01 ? * 3-7 *)"
  cw_metric_log_error_pattern      = "\"[ERROR]\" \"Snapshot backup Lambda failed\""
  cw_alarm_namespace               = "ebs-snapshot-lambda"
}

# EBS cleanup Lambda
ebs_snapshot_cleanup = {
  is_enabled                       = true
  s3_key                           = "lambda/ebs_cleanup_lambda.py.zip"
  memory_size                      = 128
  timeout                          = 120
  publish                          = true
  cloudwatch_log_retention_in_days = 14
  cw_rule_schedule_expression      = "cron(00 03 ? * 3-7 *)"
  cw_metric_log_error_pattern      = "\"[ERROR]\" \"Snapshot Cleanup Lambda failed\""
  cw_alarm_namespace               = "ebs-snapshot-cleanup-lambda"
  min_num_of_snapshots_to_retain   = 7
  min_retention_days               = 7
}

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"