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

vpc_endpoint_subnets_cidrs = [
  "10.167.21.160/28",
  "10.167.21.176/28",
  "10.167.21.192/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.16.0/27",
  "10.167.16.32/27",
  "10.167.16.64/27",
]

tars_alb_internal = [
  "10.167.16.96/28",
  "10.167.16.112/28",
  "10.167.16.128/28",
]

obs_alb_internal = [
  "10.167.16.144/28",
  "10.167.16.160/28",
  "10.167.16.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.16.192/28",
  "10.167.16.208/28",
  "10.167.16.224/28",
]

nat_subnets_cidrs = [
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

tars_dvsa_alb_cidrs = [
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

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.21.208/28",
]

apache_subnet_cidrs = [
  "10.167.21.224/28",
  "10.167.21.240/28",
  "10.167.22.0/28",
]

sftpplus_nlb_subnets_cidrs = [
  "10.167.22.32/28",
  "10.167.22.48/28",
  "10.167.22.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.22.80/28",
  "10.167.22.96/28",
  "10.167.22.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.22.128/28",
  "10.167.22.144/28",
  "10.167.22.160/28",
]

cpc_alb_internal = [
  "10.167.22.176/28",
  "10.167.22.192/28",
  "10.167.22.208/28",
]

bobj_subnets_cidrs = [
  "10.167.22.224/28",
  "10.167.22.240/28",
  "10.167.23.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.23.16/28",
  "10.167.23.32/28",
  "10.167.23.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.23.64/28",
  "10.167.23.80/28",
  "10.167.23.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.23.112/28",
  "10.167.23.128/28",
  "10.167.23.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.23.160/28",
  "10.167.23.176/28",
  "10.167.23.192/28",
]
tars_lambda_subnets_cidrs = [
  "10.167.23.208/28",
  "10.167.23.224/28",
  "10.167.23.240/28",
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
tars_rds_snapshot = "tars-core-tarsdb-20190410-5-4-0-1"
tars_rds_allocated_storage = "350"
tars_rds_backup_retention = "21"

# CPCDB
cpc_rds_username = "cpcadmin"
cpc_rds_allocated_storage = "150"
cpc_rds_snapshot = "cpc-cpcdb-20190315-5-4-0-1"
cpc_rds_backup_retention = "21"
cpc_rds_engine_version = "19.0.0.0.ru-2021-07.rur-2021-07.r1"
cpc_rds_parameter_group_name = "cpcdb-19c"
cpc_rds_option_group_name = "option-group-19c"
cpc_allow_major_version_upgrade = true

# IBSDB
ibs_rds_username = "ibsuatadmin"
ibs_rds_snapshot = "sit01-ibs-subnet-move"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"
mis_rds_allocated_storage = "300"
mis_rds_autoscale = "False"
mis_rds_backup_retention = "21"
mis_rds_engine_version = "19.0.0.0.ru"
mis_rds_parameter_group_name = "misdb-19c"
mis_rds_option_group_name = "option-group-19c"
mis_allow_major_version_upgrade = true

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"
rsis_rds_allocated_storage = "300"
rsis_rds_autoscale = "False"
rsis_rds_backup_retention = "21"

#############################################################################
# VPC to DVSA WAN via DX
#############################################################################

# New World
dvsa_wan_connectivity_enabled = true

# Old World
transit_peering_enabled = false

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "sit01.nonprod.tars.dev-dvsacloud.uk"

mes_api_cidr_block = ["10.21.0.0/16"]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = true

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled = false
rds_cw_metric_freestoragespace_alarm_action_enabled = true

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

#Turn off Prometheus
prometheus_asg_max_size       = 0

# Lambda

notify_lambda_version = "1"
api_notify = {
  handler                = "notify.handleAsync"
  #s3_key_prefix          = "functions/notify"
  s3_key_prefix          = "lambda-repo/packages/gov-notify/tars-gov-notify"
  memory_size            = 128
  timeout                = 5
  publish                = false
  cwlg_retention_in_days = 3
  log_level              = "DEBUG"
}

