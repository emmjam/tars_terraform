##########
# GENERAL
##############################################################################
project = "tars"

environment = "uat01"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "uat01"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "uat01"
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
# uat01
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.12.0/22"

jenkinsnode_subnets_cidrs = [
  "10.167.12.0/28",
  "10.167.12.16/28",
  "10.167.12.32/28",
]

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"

mgmt_env = "mgmt"

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.13.0/27",
  "10.167.13.32/27",
  "10.167.13.64/27",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.14.0/26",
  "10.167.14.64/26",
  "10.167.14.128/26",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.13.96/28",
  "10.167.13.112/28",
  "10.167.13.128/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.12.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.12.176/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.12.64/28",
  "10.167.12.80/28",
  "10.167.12.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.12.112/28",
  "10.167.12.128/28",
  "10.167.12.144/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.13.160/28",
  "10.167.13.176/28",
  "10.167.13.192/28",
]

jmeter_subnets_cidrs = [
  "10.167.13.208/26",
  "10.167.13.224/26",
  "10.167.13.240/26",
]

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

# TARSDB
tars_rds_username = "tarsuatadmin"

tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

# TARSDB
tars_rds_allocated_storage = "300"
tars_rds_snapshot = "tarsuat-050418"

#############################################################################
# Transit VPC peering
#############################################################################

transit_peering_enabled = true
