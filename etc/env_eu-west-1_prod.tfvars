##########
# GENERAL
##############################################################################
project = "tars"

environment = "prod"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "prod"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "prod"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "prod"
    "propagate_at_launch" = "true"
  }
]

###############################################################################
# CTRL
###############################################################################

##########
# Guardduty
##############################################################################

guardduty_master_enabled = "0"
guardduty_member_enabled = "0"

###############################################################################
# prod
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.128.0/22"

jenkinsnode_subnets_cidrs = [
  "10.167.128.0/28",
  "10.167.128.16/28",
  "10.167.128.32/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.128.64/28",
  "10.167.128.80/28",
  "10.167.128.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.128.112/28",
  "10.167.128.128/28",
  "10.167.128.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.128.160/28",
  "10.167.128.192/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.128.176/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.129.0/27",
  "10.167.129.32/27",
  "10.167.129.64/27",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.129.96/28",
  "10.167.129.112/28",
  "10.167.129.128/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.129.160/28",
  "10.167.129.176/28",
  "10.167.129.192/28",
]

jmeter_subnets_cidrs = [
  "10.167.129.208/28",
  "10.167.129.224/28",
  "10.167.129.240/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.130.0/28",
  "10.167.130.16/28",
  "10.167.130.32/28",
]

ibs_subnets_cidrs = [
  "10.167.130.48/28",
  "10.167.130.64/28",
  "10.167.130.80/28",
]

ibs_db_subnets_cidrs = [
  "10.167.130.96/28",
  "10.167.130.112/28",
  "10.167.130.128/28",
]

#OBS CIDR Range

obs_subnets_cidrs = [
  "10.167.130.192/28",
  "10.167.130.208/28",
  "10.167.130.224/28",
]

cpc-back_subnets_cidrs = [
  "10.167.131.0/28",
  "10.167.131.16/28",
  "10.167.131.32/28",
]

cpc-front_subnets_cidrs = [
  "10.167.131.48/28",
  "10.167.131.64/28",
  "10.167.131.80/28",
]

elc_main_subnets_cidrs = [
  "10.167.131.96/28",
  "10.167.131.112/28",
  "10.167.131.128/28",
]

batch_efs_subnets_cidrs = [
  "10.167.131.144/28",
  "10.167.131.160/28",
  "10.167.131.176/28",
]

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"

mgmt_env = "mgmt"


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

# TARSDB
tars_rds_username = "tarsuatadmin"

tars_rds_password = "sPPmE94NsvmfTmqj5K5YvFxZLmnm9T"

# TARSDB
tars_rds_allocated_storage = "300"
tars_rds_snapshot = "tarsuat-050418"

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "YwBWc8HvweT3Lun8"

# CPCTSDB
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "cpcdev01-180621"

# IBSDB
ibs_rds_username = "ibsprodadmin"

ibs_rds_password = "sPPmE94NsvmfTmqj5K5YvFxZLmnm9T"

#############################################################################
# Transit VPC peering
#############################################################################

transit_peering_enabled = true

#############################################################################
# DVSA AD VPC peering
#############################################################################

ad_peering_enabled = true
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

#############################################################################
# CWLES
#############################################################################

cwles_curator_max_age = "30"

cwles_data_instance_type    = "m4.large.elasticsearch"
cwles_data_instance_count   = "2"
cwles_data_volume_size      = "512"
cwles_master_instance_type  = "t2.small.elasticsearch"
cwles_master_instance_count = "2"
