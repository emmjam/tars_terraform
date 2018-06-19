##########
# GENERAL
##############################################################################
project = "tars"

environment = "sit01"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "sit01"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "sit01"
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
# sit01
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.8.0/22"

jenkinsnode_subnets_cidrs = [
  "10.167.8.0/28",
  "10.167.8.16/28",
  "10.167.8.32/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.8.64/28",
  "10.167.8.80/28",
  "10.167.8.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.8.112/28",
  "10.167.8.128/28",
  "10.167.8.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.8.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.8.176/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.9.0/27",
  "10.167.9.32/27",
  "10.167.9.64/27",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.9.96/28",
  "10.167.9.112/28",
  "10.167.9.128/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.9.160/28",
  "10.167.9.176/28",
  "10.167.9.192/28",
]

jmeter_subnets_cidrs = [
  "10.167.9.208/28",
  "10.167.9.224/28",
  "10.167.9.240/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.10.0/28",
  "10.167.10.16/28",
  "10.167.10.32/28",
]

ibs_subnets_cidrs = [
  "10.167.10.48/28",
  "10.167.10.64/28",
  "10.167.10.80/28",
]

ibs_db_subnets_cidrs = [
  "10.167.10.96/28",
  "10.167.10.112/28",
  "10.167.10.128/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.10.192/28",
  "10.167.10.208/28",
  "10.167.10.224/28",
]

cpc_backend_subnets_cidrs = [
  "10.167.11.0/28",
  "10.167.11.16/28",
  "10.167.11.32/28",
]

cpc_frontend_subnets_cidrs = [
  "10.167.11.48/28",
  "10.167.11.60/28",
  "10.167.11.76/28",
]

elc_main_subnets_cidrs = [
  "10.167.11.96/28",
  "10.167.11.112/28",
  "10.167.11.128/28",
]

batch_efs_subnets_cidrs = [
  "10.167.11.144/28",
  "10.167.11.160/28",
  "10.167.11.176/28",
]

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"

mgmt_env = "mgmt"


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

ad_peering_enabled = false
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# TARSDB
tars_rds_username = "tarsuatadmin"

tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

# TARSDB
tars_rds_snapshot = "tarsuat-050418"
tars_rds_allocated_storage = "300"
tars_rds_autoscale = "False"

# IBSDB
ibs_rds_username = "ibsuatadmin"

ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

#############################################################################
# Transit VPC peering
#############################################################################

transit_peering_enabled = true
