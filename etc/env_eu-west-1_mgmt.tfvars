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
  "karl.gharios@bjss.com",
  "callum.massey@bjss.com",
]

###########################################
# Peering
###########################################

ctrl_peers_xacct = [
  { # tarsnonprod/ctrl
    vpc_id     = "vpc-9f2ba7f9"
    cidr_block = "10.167.60.0/22"
    account_id = "652856684323"
  }
]

# Peers created by the ctrl component, in the same AWS account
ctrl_peers_local = [
  { # tarsmgmt/ctrl
    vpc_id     = "vpc-ff970799"
    cidr_block = "10.167.64.0/22"
    account_id = "645711882182"
  }
]

base_peers_local = []

# Peers created by the base component, in a different AWS account
base_peers_xacct = [
  { # tarsnonprod/opsdev
    vpc_id     = "vpc-e560ef83"
    cidr_block = "10.167.0.0/22"
    account_id = "652856684323"
  }
]


########
# MGMT
###############################################################################
vpc_cidr = "10.200.0.0/16"

nat_subnets_cidr = "10.200.1.0/28"


## bastion
bastion = {
  instance_type        = "t2.micro"
  ami_build_id         = "38"
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

bastion_whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "77.86.30.4/32",      # BJSS VPN (Decom ~06/18)
  "148.253.134.213/32", # BJSS VPN 04/18
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "92.54.181.128/29",   # Informed Solutions
  "87.81.132.117/32",   # Informed Solutions
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
  ami_build_id         = "2"
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
  engine_version          = "9.6.6"
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
  snapshot_retention_limit = 0                                                           # backups turned off
  endpoint_address         = "rsp-mgmt-mgmt-gitlab.ow39bf.0001.euw1.cache.amazonaws.com" # endpoint address is not revealable yet
}

gitlab_redis_subnets_cidrs = [
  "10.200.2.80/28",
  "10.200.2.96/28",
  "10.200.2.112/28",
]

gitlab_whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "77.86.30.4/32",      # BJSS VPN
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "92.54.181.128/29",   # Informed Solutions
  "87.81.132.117/32",   # Informed Solutions
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
jenkins_blue_version = "2.89.3-1.1"

jenkins_elb_subnets_cidrs = ["10.200.3.32/28"]

## jenkinsnode
jenkinsnode = {
  instance_type        = "m4.large"
  ami_build_id         = "32"
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
  "135.196.73.204/32",  # DVSA Notts Corp
  "213.160.121.250/32", # DVSA Notts Wifi
  "77.86.30.4/32",      # BJSS VPN
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "92.54.181.128/29",   # Informed Solutions
  "87.81.132.117/32",   # Informed Solutions
]

## ctrl
ctrl_peers = [
  {
    account_id         = "652856684323"   # tars ctrl/nonprod
    vpc_id             = "vpc-9f2ba7f9"
    cidr_block         = "10.167.60.0/22"
    jenkinsnode_subnet = "10.167.60.0/26"
  },
  {
    account_id         = "645711882182" # tars ctrl/mgmt
    vpc_id             = "vpc-ff970799"
    cidr_block         = "10.167.64.0/22"
    jenkinsnode_subnet = "10.167.64.0/26"
  },
]

## dev01
dev01_peers = [
  {
    account_id         = "652856684323"  # tars tars/dev01
    vpc_id             = "vpc-61ce4107"
    cidr_block         = "10.167.4.0/22"
    jenkinsnode_subnet = "10.167.4.0/26"
  },
]

## nonprod/opsdev
opsdev_peers = [
  {
    account_id         = "652856684323"  # tars tars/nonprod
    vpc_id             = "vpc-e560ef83"
    cidr_block         = "10.167.0.0/22"
    jenkinsnode_subnet = "10.167.0.0/26"
  },
]

## sit01
sit01_peers = [
  {
    account_id         = "652856684323"  # tars tars/dev01
    vpc_id             = "vpc-57179931"
    cidr_block         = "10.167.8.0/22"
    jenkinsnode_subnet = "10.167.8.0/26"
  },
]

## uat01
uat01_peers = [
  {
    account_id         = "652856684323"   # tars tars/dev01
    vpc_id             = "vpc-411b9527"
    cidr_block         = "10.167.12.0/22"
    jenkinsnode_subnet = "10.167.12.0/26"
  },
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
