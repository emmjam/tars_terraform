##########
# GENERAL
##############################################################################
project = "tars"

environment = "sit02"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "mes"
  Environment = "sit02"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "mes"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "sit02"
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
# sit02
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.80.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.80.0/27",
  "10.167.80.32/27",
  "10.167.80.64/27",
]

tars_alb_internal = [
  "10.167.80.96/28",
  "10.167.80.112/28",
  "10.167.80.128/28",
]

obs_alb_internal = [
  "10.167.80.144/28",
  "10.167.80.160/28",
  "10.167.80.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.80.192/28",
  "10.167.80.208/28",
  "10.167.80.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.80.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.81.0/27",
  "10.167.81.32/27",
  "10.167.81.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.81.96/28",
  "10.167.81.112/28",
  "10.167.81.128/28",
]

#  "10.167.81.144/28",
#  "10.167.81.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.81.176/28",
  "10.167.81.192/28",
  "10.167.81.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.81.224/28",
  "10.167.81.240/28",
  "10.167.82.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.82.16/28",
  "10.167.82.32/28",
  "10.167.82.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.82.64/28",
  "10.167.82.80/28",
  "10.167.82.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.82.112/28",
  "10.167.82.128/28",
  "10.167.82.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.82.160/28",
  "10.167.82.176/28",
  "10.167.82.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.82.208/28",
  "10.167.82.224/28",
  "10.167.82.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.83.0/28",
  "10.167.83.16/28",
  "10.167.83.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.83.48/28",
  "10.167.83.64/28",
  "10.167.83.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.83.96/28",
  "10.167.83.112/28",
  "10.167.83.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.83.144/28",
  "10.167.83.160/28",
  "10.167.83.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.83.192/28",
  "10.167.83.208/28",
  "10.167.83.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.83.240/28",
  "10.167.84.0/28",
  "10.167.84.16/28",
]

ibs_subnets_cidrs = [
  "10.167.84.32/28",
  "10.167.84.48/28",
  "10.167.84.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.84.80/28",
  "10.167.84.96/28",
  "10.167.84.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.84.128/28",
  "10.167.84.144/28",
  "10.167.84.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.84.176/28",
  "10.167.84.192/28",
  "10.167.84.208/28",
]

xenco_subnets_cidrs = [
  "10.167.84.224/28",
  "10.167.84.240/28",
  "10.167.85.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.85.16/28",
  "10.167.85.32/28",
  "10.167.85.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.85.64/28",
  "10.167.85.80/28",
  "10.167.85.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.85.112/28",
  "10.167.85.128/28",
  "10.167.85.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.85.160/28",
  "10.167.85.176/28",
  "10.167.85.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.85.208/28",
]

apache_subnet_cidrs = [
  "10.167.85.224/28",
  "10.167.85.240/28",
  "10.167.86.0/28",
]

#  "10.167.86.16/28",

sftpplus_nlb_subnets_cidrs = [
  "10.167.86.32/28",
  "10.167.86.48/28",
  "10.167.86.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.86.80/28",
  "10.167.86.96/28",
  "10.167.86.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.86.128/28",
  "10.167.86.144/28",
  "10.167.86.160/28",
]

cpc_alb_internal = [
  "10.167.86.176/28",
  "10.167.86.192/28",
  "10.167.86.208/28",
]

bobj_subnets_cidrs = [
  "10.167.86.224/28",
  "10.167.86.240/28",
  "10.167.87.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.87.16/28",
  "10.167.87.32/28",
  "10.167.87.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.87.64/28",
  "10.167.87.80/28",
  "10.167.87.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.87.112/28",
  "10.167.87.128/28",
  "10.167.87.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.87.160/28",
  "10.167.87.176/28",
  "10.167.87.192/28",
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

ad_peering_enabled = false
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# TARSDB
tars_rds_username = "tarsuatadmin"
tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
tars_rds_snapshot = "tars-core-tarsdb-20190410-5-4-0-1"
tars_rds_allocated_storage = "300"
tars_rds_autoscale = "False"
tars_rds_backup_retention = "21"

# CPCSDB
cpc_rds_username = "cpcuatadmin"
cpc_rds_password = "Mg28yDQjuEWndbtz"
cpc_rds_allocated_storage = "100"
cpc_rds_snapshot = "tars-sit01-cpc-cpcdb-20190226-5-4-0-2"
cpc_rds_backup_retention = "21"

# IBSDB
ibs_rds_username = "ibsuatadmin"
ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
ibs_rds_snapshot = "sit02-ibs-subnet-move"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"
mis_rds_allocated_storage = "330"
mis_rds_autoscale = "False"
mis_rds_backup_retention = "21"

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
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

private_cert_domain_name = "sit02.tars.dvsa.aws"

mes_api_cidr_block = ["10.21.0.0/16"]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = false

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled = false
