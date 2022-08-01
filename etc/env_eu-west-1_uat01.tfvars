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
  DVSA_Env    = "staging"
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
vpc_cidr = "10.167.8.0/21"

vpc_endpoint_subnets_cidrs = [
  "10.167.13.160/28",
  "10.167.13.176/28",
  "10.167.13.192/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.8.0/27",
  "10.167.8.32/27",
  "10.167.8.64/27",
]

tars_alb_internal = [
  "10.167.8.96/28",
  "10.167.8.112/28",
  "10.167.8.128/28",
]

obs_alb_internal = [
  "10.167.8.144/28",
  "10.167.8.160/28",
  "10.167.8.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.8.192/28",
  "10.167.8.208/28",
  "10.167.8.224/28",
]

nat_subnets_cidrs = [
  "10.167.8.240/28",
]

elc_main_subnets_cidrs = [
  "10.167.9.48/28",
  "10.167.9.64/28",
  "10.167.9.80/28",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.9.96/28",
  "10.167.9.112/28",
  "10.167.9.128/28",
]

tars_messaging_alb_subnets_cidrs = [
  "10.167.9.176/28",
  "10.167.9.192/28",
  "10.167.9.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.9.224/28",
  "10.167.9.240/28",
  "10.167.10.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.10.16/28",
  "10.167.10.32/28",
  "10.167.10.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.10.64/28",
  "10.167.10.80/28",
  "10.167.10.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.10.112/28",
  "10.167.10.128/28",
  "10.167.10.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.10.160/28",
  "10.167.10.176/28",
  "10.167.10.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.10.208/28",
  "10.167.10.224/28",
  "10.167.10.240/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.11.0/28",
  "10.167.11.16/28",
  "10.167.11.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.11.48/28",
  "10.167.11.64/28",
  "10.167.11.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.11.96/28",
  "10.167.11.112/28",
  "10.167.11.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.11.144/28",
  "10.167.11.160/28",
  "10.167.11.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.11.192/28",
  "10.167.11.208/28",
  "10.167.11.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.11.240/28",
  "10.167.12.0/28",
  "10.167.12.16/28",
]

ibs_subnets_cidrs = [
  "10.167.12.32/28",
  "10.167.12.48/28",
  "10.167.12.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.12.80/28",
  "10.167.12.96/28",
  "10.167.12.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.12.128/28",
  "10.167.12.144/28",
  "10.167.12.160/28",
]

# "10.167.12.224/28",
# "10.167.12.240/28",

tars_backend_subnets_cidrs = [
  "10.167.13.0/27",
  "10.167.13.32/27",
  "10.167.13.64/27",
]

cpc_efs_subnets_cidrs = [
  "10.167.13.112/28",
  "10.167.13.128/28",
  "10.167.13.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.13.208/28",
]

sftpplus_nlb_subnets_cidrs = [
  "10.167.14.32/28",
  "10.167.14.48/28",
  "10.167.14.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.14.80/28",
  "10.167.14.96/28",
  "10.167.14.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.14.128/28",
  "10.167.14.144/28",
  "10.167.14.160/28",
]

cpc_alb_internal = [
  "10.167.14.176/28",
  "10.167.14.192/28",
  "10.167.14.208/28",
]

bobj_subnets_cidrs = [
  "10.167.14.224/28",
  "10.167.14.240/28",
  "10.167.15.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.15.0/28",
  "10.167.15.16/28",
  "10.167.15.32/28",
]

batch_efs_subnets_cidrs = [
  "10.167.15.48/28",
  "10.167.15.64/28",
  "10.167.15.80/28",
]

prometheus_subnets_cidrs = [
  "10.167.15.96/28",
  "10.167.15.112/28",
  "10.167.15.128/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.15.144/28",
  "10.167.15.160/28",
  "10.167.15.176/28",
]

prometheus_alb_private_cidrs = [
  "10.167.15.192/28",
  "10.167.15.208/28",
  "10.167.15.224/28",
]

tars_lambda_subnets_cidrs = [
  "10.167.9.0/28",
  "10.167.9.16/28",
  "10.167.9.32/28",
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
ad_peering_vpc     = "vpc-02072cb35506d9b73"
ad_account         = "233824316563"

# TARSDB
tars_rds_username          = "tarsuatadmin"
tars_rds_allocated_storage = "610"
tars_rds_snapshot          = "tars-core-tarsdb-20190410-5-4-0-1"
tars_rds_backup_retention  = "21"

# CPCDB
cpc_rds_username          = "cpcuatadmin"
cpc_rds_allocated_storage = "100" # 20 Gigabyte - was 1500GB
#cpc_rds_snapshot          = "tars-uat01-cpc-cpcdb-5-4-2019-5-7-0-2"
cpc_rds_snapshot          = "tars-cpc-db-anon2-28072022-do-not-delete"
cpc_rds_backup_retention  = "21"
#cpc_rds_engine_version    = "19.0.0.0.ru-2022-01.rur-2022-01.r1"

# IBSDB
ibs_rds_username = "tarsuatadmin"
ibs_rds_snapshot = "uat01-ibs-subnet-move"

# MISDB
mis_rds_username          = "misuatadmin"
mis_rds_allocated_storage = "440"
#mis_rds_snapshot          = "tars-uat01-tars-reporting-misdb-20181108"
mis_rds_snapshot          = "tars-mis-db-anon2-28072022-do-not-delete"
mis_rds_autoscale         = "False"
mis_rds_backup_retention  = "21"
#mis_rds_engine_version    = "19.0.0.0.ru-2022-01.rur-2022-01.r1"

# RSISDB
rsis_rds_username                = "rsisuatadmin"
rsis_rds_allocated_storage       = "120"
#rsis_rds_snapshot                = "tars-uat01-tars-reporting-rsisdb-20181108"
rsis_rds_snapshot                = "tars-rsis-db-anon2-28072022-do-not-delete"
rsis_rds_autoscale               = "False"
rsis_rds_backup_retention        = "21"
rsis_rds_engine_version          = "19.0.0.0.ru-2022-01.rur-2022-01.r1"

#############################################################################
# VPC to DVSA WAN via DX
#############################################################################

# New World
dvsa_wan_connectivity_enabled = true

# Old World
transit_peering_enabled = false

## wildfly-messaging
wildfly-messaging_puppet_nodetype      = "tars-messaging"
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_recurrence   = "00 07 * * 1-5"

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "uat01.nonprod.tars.dev-dvsacloud.uk"

# Temporary allocation -
# To be removed when overall range is increased
apache_subnet_cidrs = [
  "10.167.12.224/28",
  "10.167.12.240/28",
  "10.167.13.96/28",
]

mes_api_cidr_block = ["10.21.0.0/16"]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = true

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled                  = false
rds_cw_metric_freestoragespace_alarm_action_enabled = true

api_notify = {
  handler                = "notify.handleAsync"
  s3_key_prefix          = "lambda-repo/packages/gov-notify/tars-gov-notify"
  memory_size            = 128
  timeout                = 5
  publish                = false
  cwlg_retention_in_days = 3
  log_level              = "DEBUG"
}

ses_user_access_key = true

# DocumentBatchUpdate - maximum records processed in the Job Polling
dbu_maxrecordsprocessed = 500

# Process Unknown Card Authorisations Job - Challenged Card Auth
puca_job_cca_minAgeHours                      = 1
puca_job_cca_maxAgeDays                       = 0
puca_job_cca_maxProcessed                     = 5
puca_job_cca_communicationError_minAgeHours   = 1
puca_job_cca_communicationError_maxAgeDays    = 0
puca_job_cca_communicationError_maxProcessed  = 1
puca_job_cca_nonfinalepdqstatus_minAgeHours   = 1
puca_job_cca_nonfinalepdqstatus_maxAgeDays    = 60
puca_job_cca_nonfinalepdqstatus_maxProcessed  = 2
puca_job_cca_maxRecordsPerJobRun              = 5 
transfer_theory_test_extract_file_to_ftts_job_directory = "/efs/tars/FTP/irdt/eligibility/ftts"