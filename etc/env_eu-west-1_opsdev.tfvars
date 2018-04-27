##########
# GENERAL
##############################################################################
project = "tars"

environment = "opsdev"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "opsdev"
}

###############################################################################
# CTRL
###############################################################################
## ctrl
ctrl_peers = [
  {
    account_id         = "652856684323"   # tars ctrl/nonprod
    vpc_id             = "vpc-9f2ba7f9"
    cidr_block         = "10.167.60.0/22"
    jenkinsnode_subnet = "10.167.60.0/26"
  },
]

###############################################################################
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.0.0/22"

## jenkinsnode
jenkinsnode = {
  instance_type        = "m4.large"
  ami_build_id         = "39"
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

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.0.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.0.176/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.1.0/27",
  "10.167.1.32/27",
  "10.167.1.64/27",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.1.96/28",
  "10.167.1.112/28",
  "10.167.1.128/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.1.160/28",
  "10.167.1.176/28",
  "10.167.1.192/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.2.0/26",
  "10.167.2.64/26",
  "10.167.2.128/26",
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
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "92.54.181.128/29",   # Informed Solutions
  "87.81.132.117/32",   # Informed Solutions
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
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "92.54.181.128/29",   # Informed Solutions
  "87.81.132.117/32",   # Informed Solutions
]

mq_console_whitelist = [
  "77.86.30.4/32", # BJSS VPN
]

## wildfly-back
wildfly-back = {
  instance_type  = "t2.medium"
  puppet_env     = "opsdev"
  puppet_node    = ""
  puppet_type    = ""
  puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"

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
  instance_type  = "t2.medium"
  puppet_env     = "opsdev"
  puppet_node    = ""
  puppet_type    = ""
  puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"

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
  instance_type  = "t2.medium"
  puppet_env     = "opsdev"
  puppet_node    = ""
  puppet_type    = ""
  puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"

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
  instance_type  = "t2.medium"
  puppet_env     = "opsdev"
  puppet_node    = ""
  puppet_type    = ""
  puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"

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
  engine_type             = "ActiveMQ"
  engine_version          = "5.15.0"
  host_instance_type      = "mq.t2.micro"
  deployment_mode         = "SINGLE_INSTANCE"
}

aws_mq_users = {
  admin_user              = "admin"
  admin_password          = "admin123456789"
  tars_batch_user         = "tars_batch"
  tars_batch_password     = "password123456"
  tars_batch_group        = "admins"
  tars_messaging_user     = "tars_messaging"
  tars_messaging_password = "password123456"
  tars_messaging_group    = "admins"
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
tars_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB

tars_rds_storage_type = "gp2"

tars_rds_engine = "oracle-se2"

tars_rds_engine_version = "12.1.0.2.v11"

tars_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"

tars_rds_port = "1521"

tars_rds_public = "false"

tars_rds_multi_az = "false" # it takes an age to build if true

tars_rds_backup_retention = "0"

tars_rds_backup_window = "02:38-03:08"

tars_rds_maint_window = "sun:03:16-sun:03:46"

tars_rds_skip_final_snapshot = true

tars_rds_apply_immediately = "true"

tars_rds_license_model = "license-included"

tars_rds_snapshot = "tars-testdb-210218"

# Xenco temp dev box
xenconode = {
  instance_type        = "m4.large"
  ami_id               = "ami-f06bf389"
  asg_min_size         = 0
  asg_max_size         = 1
  rpms_to_install      = "gcc kernel-devel kernel-headers"
  key_name             = "deployer"
}

xenco_whitelist = [
  "77.86.30.4/32",      # BJSS VPN (Decom ~06/18)
  "148.253.134.213/32", # BJSS VPN 04/18
]

# Xenco CIDR Range
xenco_subnets_cidrs = [
  "10.167.3.241/28",
]
