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
vpc_cidr = "10.167.16.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.16.0/26",
  "10.167.16.64/26",
  "10.167.16.128/26",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.16.192/28",
  "10.167.16.208/28",
  "10.167.16.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.16.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.17.0/27",
  "10.167.17.32/27",
  "10.167.17.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.17.96/28",
  "10.167.17.112/28",
  "10.167.17.128/28",
]

#  "10.167.17.144/28",
#  "10.167.17.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.17.176/28",
  "10.167.17.192/28",
  "10.167.17.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.17.224/28",
  "10.167.17.240/28",
  "10.167.18.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.18.16/28",
  "10.167.18.32/28",
  "10.167.18.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.18.64/28",
  "10.167.18.80/28",
  "10.167.18.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.18.112/28",
  "10.167.18.128/28",
  "10.167.18.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.18.160/28",
  "10.167.18.176/28",
  "10.167.18.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.18.208/28",
  "10.167.18.224/28",
  "10.167.18.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.19.0/28",
  "10.167.19.16/28",
  "10.167.19.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.19.48/28",
  "10.167.19.64/28",
  "10.167.19.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.19.96/28",
  "10.167.19.112/28",
  "10.167.19.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.19.144/28",
  "10.167.19.160/28",
  "10.167.19.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.19.192/28",
  "10.167.19.208/28",
  "10.167.19.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.19.240/28",
  "10.167.20.0/28",
  "10.167.20.16/28",
]

ibs_subnets_cidrs = [
  "10.167.20.32/28",
  "10.167.20.48/28",
  "10.167.20.64/28",
]

ibs_db_subnets_cidrs = [
  "10.167.20.80/28",
  "10.167.20.96/28",
  "10.167.20.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.20.128/28",
  "10.167.20.144/28",
  "10.167.20.160/28",
]

xenco_nlb_subnets_cidrs = [
  "10.167.20.176/28",
  "10.167.20.192/28",
  "10.167.20.208/28",
]

xenco_subnets_cidrs = [
  "10.167.20.224/28",
  "10.167.20.240/28",
  "10.167.21.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.21.16/28",
  "10.167.21.32/28",
  "10.167.21.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.21.64/28",
  "10.167.21.80/28",
  "10.167.21.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.21.112/28",
  "10.167.21.128/28",
  "10.167.21.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.21.160/28",
  "10.167.21.176/28",
  "10.167.21.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.21.208/28",
#  "10.167.21.224/28",
#  "10.167.21.240/28",
]

#  "10.167.22.0/28",
#  "10.167.22.16/28",

test_database_subnets_cidrs = [
  "10.167.22.32/27",
  "10.167.22.64/27",
  "10.167.22.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.22.128/28",
  "10.167.22.144/28",
  "10.167.22.160/28",
]

third_party_subnets_cidrs = [
  "10.167.22.176/28",
  "10.167.22.192/28",
  "10.167.22.208/28",
]

owasp_subnets_cidrs = [
  "10.167.22.224/28",
  "10.167.22.240/28",
  "10.167.23.0/28",
]

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"

mgmt_env = "mgmt"


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

#############################################################################
# DVSA AD VPC peering
#############################################################################

ad_peering_enabled = true
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# TARSDB
tars_rds_username = "tarsuatadmin"

tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

# TARSDB
tars_rds_snapshot = "tars-sit01-tars-core-tarsdb-20180720"
tars_rds_allocated_storage = "300"
tars_rds_autoscale = "False"

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "YwBWc8HvweT3Lun8"

# CPCTSDB
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-sit01-cpc-cpcdb-20180720"

# IBSDB
ibs_rds_username = "ibsuatadmin"

ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

#############################################################################
# Transit VPC peering
#############################################################################

transit_peering_enabled = true
