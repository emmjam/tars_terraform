##########
# GENERAL
##############################################################################
project = "tars"

environment = "dev01"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "dev01"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "dev01"
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
# dev01
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.24.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.24.0/27",
  "10.167.24.32/27",
  "10.167.24.64/27",
]

tars_alb_internal = [
  "10.167.24.96/28",
  "10.167.24.112/28",
  "10.167.24.128/28",
]

obs_alb_internal = [
  "10.167.24.144/28",
  "10.167.24.160/28",
  "10.167.24.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.24.192/28",
  "10.167.24.208/28",
  "10.167.24.224/28",
]

nat_subnets_cidrs = [
  "10.167.24.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.25.0/27",
  "10.167.25.32/27",
  "10.167.25.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.25.96/28",
  "10.167.25.112/28",
  "10.167.25.128/28",
]

#  "10.167.25.144/28",
#  "10.167.25.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.25.176/28",
  "10.167.25.192/28",
  "10.167.25.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.25.224/28",
  "10.167.25.240/28",
  "10.167.26.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.26.16/28",
  "10.167.26.32/28",
  "10.167.26.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.26.64/28",
  "10.167.26.80/28",
  "10.167.26.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.26.112/28",
  "10.167.26.128/28",
  "10.167.26.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.26.160/28",
  "10.167.26.176/28",
  "10.167.26.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.26.208/28",
  "10.167.26.224/28",
  "10.167.26.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.27.0/28",
  "10.167.27.16/28",
  "10.167.27.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.27.48/28",
  "10.167.27.64/28",
  "10.167.27.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.27.96/28",
  "10.167.27.112/28",
  "10.167.27.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.27.144/28",
  "10.167.27.160/28",
  "10.167.27.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.27.192/28",
  "10.167.27.208/28",
  "10.167.27.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.27.240/28",
  "10.167.28.0/28",
  "10.167.28.16/28",
]

ibs_subnets_cidrs = [
  "10.167.28.32/28",
  "10.167.28.48/28",
  "10.167.28.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.28.80/28",
  "10.167.28.96/28",
  "10.167.28.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.28.128/28",
  "10.167.28.144/28",
  "10.167.28.160/28",
]

elc_main_subnets_cidrs = [
  "10.167.29.16/28",
  "10.167.29.32/28",
  "10.167.29.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.29.64/28",
  "10.167.29.80/28",
  "10.167.29.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.29.112/28",
  "10.167.29.128/28",
  "10.167.29.144/28",
]
/*
jenkinsnode_subnets_cidrs = [
  "10.167.29.160/28",
  "10.167.29.176/28",
  "10.167.29.192/28",
]
*/
# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.29.208/28",
]

apache_subnet_cidrs = [
  "10.167.29.224/28",
  "10.167.29.240/28",
  "10.167.30.0/28",
]

#  "10.167.30.16/28",


sftpplus_nlb_subnets_cidrs = [
  "10.167.30.32/28",
  "10.167.30.48/28",
  "10.167.30.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.30.80/28",
  "10.167.30.96/28",
  "10.167.30.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.30.128/28",
  "10.167.30.144/28",
  "10.167.30.160/28",
]

cpc_alb_internal = [
  "10.167.30.176/28",
  "10.167.30.192/28",
  "10.167.30.208/28",
]

bobj_subnets_cidrs = [
  "10.167.30.224/28",
  "10.167.30.240/28",
  "10.167.31.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.31.16/28",
  "10.167.31.32/28",
  "10.167.31.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.31.64/28",
  "10.167.31.80/28",
  "10.167.31.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.31.112/28",
  "10.167.31.128/28",
  "10.167.31.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.31.160/28",
  "10.167.31.176/28",
  "10.167.31.192/28",
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
tars_rds_username = "tarsdevadmin"
tars_rds_allocated_storage = "90" # 20 Gigabyte - was 1500GB
tars_rds_snapshot = "tars-dev01-tars-core-tarsdb-5-4-2019-5-7-0-2"

# CPCSDB
cpc_rds_username = "tarscpcadmin"
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-dev01-cpc-cpcdb-5-4-2019-5-7-0-2"

# IBSDB
ibs_rds_username = "ibsdevadmin"
ibs_rds_snapshot = "dev01-ibs-subnet-move"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_allocated_storage = "80"
rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"

#############################################################################
# VPC to DVSA WAN via DX
#############################################################################

# New World
dvsa_wan_connectivity_enabled = true

# Old World
transit_peering_enabled = false

#############################################################################
# DVSA AD VPC peering
#############################################################################

ad_peering_enabled = true
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# These names will be added to our private zone so we can resolve them.
dsa-drora-db-rac01 = "10.86.192.16"
dsa-drora-db-rac02 = "10.86.192.17"
dsa-drora-db-rac03 = "10.86.192.72"

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "dev01.nonprod.tars.dev-dvsacloud.uk"

## Schedules
## wildfly-front
wildfly-front_scaledown_recurrence = "00 20 * * 1-5"
wildfly-front_scaleup_recurrence   = "00 00 * * 1-5"

## wildfly-back
wildfly-back_scaledown_recurrence = "00 20 * * 1-5"
wildfly-back_scaleup_recurrence   = "00 00 * * 1-5"

## wildfly-batch
wildfly-batch_scaledown_recurrence = "00 20 * * 1-5"
wildfly-batch_scaleup_recurrence   = "00 00 * * 1-5"

## obs
obs_scaledown_recurrence = "00 20 * * 1-5"
obs_scaleup_recurrence   = "00 00 * * 1-5"

## ibs
ibs_scaledown_recurrence = "00 20 * * 1-5"
ibs_scaleup_recurrence   = "10 00 * * 1-5"

## fyndi-f
fyndi-f_scaledown_recurrence = "00 20 * * 1-5"
fyndi-f_scaleup_recurrence   = "00 00 * * 1-5"

## fyndi_back
fyndi-b_scaledown_recurrence = "00 20 * * 1-5"
fyndi-b_scaleup_recurrence   = "00 00 * * 1-5"

## cpc-front
cpc-front_scaledown_recurrence = "00 20 * * 1-5"
cpc-front_scaleup_recurrence   = "00 00 * * 1-5"

## cpc-back
cpc-back_scaledown_recurrence = "00 20 * * 1-5"
cpc-back_scaleup_recurrence   = "00 00 * * 1-5"

## wildfly-mock
wildfly-mock_scaledown_recurrence = "00 20 * * 1-5"
wildfly-mock_scaleup_recurrence   = "00 00 * * 1-5"

mes_api_cidr_block = ["10.21.0.0/16"]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = true

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled = false
rds_cw_metric_freestoragespace_alarm_action_enabled = true

## Messaging
wildfly_messaging_id = "release_202004"

## Sizing
wildfly-back_asg_max_size     = 1
wildfly-back_scaleup_desired  = 1
obs_asg_max_size              = 1
obs_scaleup_desired           = 1
ibs_asg_max_size              = 1
ibs_scaleup_desired           = 1
fyndi-f_asg_max_size          = 1
fyndi-f_scaleup_desired       = 1
fyndi-b_asg_max_size          = 1
fyndi-b_scaleup_desired       = 1
wildfly-front_asg_max_size    = 1
wildfly-front_scaleup_desired = 1
cpc-back_asg_max_size         = 1
cpc-back_scaleup_desired      = 1
cpc-front_asg_max_size        = 1
cpc-front_scaleup_desired     = 1
apache_asg_max_size           = 1
apache_scaleup_desired        = 1

