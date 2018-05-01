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

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "opsdev"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "nonprod"
    "propagate_at_launch" = "true"
  }
]

###############################################################################
# CTRL
###############################################################################

###############################################################################
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.0.0/22"

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

jmeter_subnets_cidrs = [
  "10.167.1.208/28",
  "10.167.1.224/28",
  "10.167.1.240/28",
]


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
tars_rds_snapshot = "tars-testdb-210218"
