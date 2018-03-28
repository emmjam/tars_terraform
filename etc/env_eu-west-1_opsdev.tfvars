##########
# GENERAL
##############################################################################
project     = "tars"
environment = "opsdev"
aws_region  = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "opsdev"
}

private_domain_name = "private.tars.dvsa.aws"

##########
# ACCOUNT
###############################################################################
# aws_account_alias = "tarsnonprod"

# public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

users = [
  "rob.hart@dvsa.gov.uk",
]

administrators = [
  "mark.thompson@bjss.com",
  "karl.gharios@bjss.com",
]

power_users = [
  "allan.todd@bjss.com",
]

###############################################################################
# MGMT
###############################################################################

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

###############################################################################
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.0.0/22"

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
  "10.167.0.0/28",
  "10.167.0.16/28",
  "10.167.0.32/28",
]

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"
mgmt_env       = "mgmt"

backend_subnets_cidrs = [
  "10.167.1.0/27",
  "10.167.1.32/27",
  "10.167.1.64/27",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.0.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.0.176/28"
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.0.64/28",
  "10.167.0.80/28",
  "10.167.0.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.0.112/28",
  "10.167.0.128/28",
  "10.167.0.144/28",
]

tars_core_whitelist = [
  "135.196.73.204/32",  # DVSA Notts Corp
  "213.160.121.250/32", # DVSA Notts Wifi
  "77.86.30.4/32",      # BJSS VPN
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.201/32",   # Capita (Bury St Edmunds)
  "85.115.54.202/32",   # Capita (Bury St Edmunds)
  "85.115.54.203/32",   # Capita (Bury St Edmunds)
  "85.115.54.204/32",   # Capita (Bury St Edmunds)
  "85.115.54.205/32",   # Capita (Bury St Edmunds)
  "85.115.54.206/32",   # Capita (Bury St Edmunds)
]

messaging_whitelist = [
  "135.196.73.204/32",  # DVSA Notts Corp
  "213.160.121.250/32", # DVSA Notts Wifi
  "77.86.30.4/32",      # BJSS VPN
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.201/32",   # Capita (Bury St Edmunds)
  "85.115.54.202/32",   # Capita (Bury St Edmunds)
  "85.115.54.203/32",   # Capita (Bury St Edmunds)
  "85.115.54.204/32",   # Capita (Bury St Edmunds)
  "85.115.54.205/32",   # Capita (Bury St Edmunds)
  "85.115.54.206/32",   # Capita (Bury St Edmunds)
]

mq_console_whitelist = [
  "77.86.30.4/32",      # BJSS VPN
]


## wildfly-back
wildfly-back = {
  instance_type        = "t2.medium"
  puppet_env           = "opsdev"
  puppet_node          = ""
  puppet_type          = ""
  puppet_kms_key       = "791140e3-1c70-4d21-943f-007c92c1e17d"
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

## wildfly-batch
wildfly-batch = {
  instance_type        = "t2.medium"
  puppet_env           = "opsdev"
  puppet_node          = ""
  puppet_type          = ""
  puppet_kms_key       = "791140e3-1c70-4d21-943f-007c92c1e17d"
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

## wildfly-front
wildfly-front = {
  instance_type        = "t2.medium"
  puppet_env           = "opsdev"
  puppet_node          = ""
  puppet_type          = ""
  puppet_kms_key       = "791140e3-1c70-4d21-943f-007c92c1e17d"
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

## wildfly-messaging
wildfly-messaging = {
  instance_type        = "t2.medium"
  puppet_env           = "opsdev"
  puppet_node          = ""
  puppet_type          = ""
  puppet_kms_key       = "791140e3-1c70-4d21-943f-007c92c1e17d"
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

## AWS MQ
aws_mq = {
  engine_type          = "ActiveMQ"
  engine_version       = "5.15.0"
  host_instance_type   = "mq.t2.micro"
  username             = "admin"
  password             = "admin123456789"
  deployment_mode      = "SINGLE_INSTANCE"
}

aws_mq_config = {
  description    = "TARS MQ Configuration"
  name           = "tars-awsmq"
  engine_type    = "ActiveMQ"
  engine_version = "5.15.0"
}

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"


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