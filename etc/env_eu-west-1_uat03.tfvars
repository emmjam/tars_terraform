##########
# GENERAL
##############################################################################
project = "tars"

environment = "uat03"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "uat03"
  DVSA_Env    = "staging"
}

asg_default_tags = {
  Project     = "tars"
  Environment = "uat03"
  Group       = "nonprod"
}

###############################################################################
# CTRL
###############################################################################

###############################################################################
# uat03
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.88.0/21"

vpc_endpoint_subnets_cidrs = [
  "10.167.93.160/28",
  "10.167.93.176/28",
  "10.167.93.192/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.88.0/27",
  "10.167.88.32/27",
  "10.167.88.64/27",
]

tars_alb_internal = [
  "10.167.88.96/28",
  "10.167.88.112/28",
  "10.167.88.128/28",
]

obs_alb_internal = [
  "10.167.88.144/28",
  "10.167.88.160/28",
  "10.167.88.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.88.192/28",
  "10.167.88.208/28",
  "10.167.88.224/28",
]

nat_subnets_cidrs = [
  "10.167.88.240/28",
]

elc_main_subnets_cidrs = [
  "10.167.89.48/28",
  "10.167.89.64/28",
  "10.167.89.80/28",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.89.96/28",
  "10.167.89.112/28",
  "10.167.89.128/28",
]

tars_messaging_alb_subnets_cidrs = [
  "10.167.89.176/28",
  "10.167.89.192/28",
  "10.167.89.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.89.224/28",
  "10.167.89.240/28",
  "10.167.90.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.90.16/28",
  "10.167.90.32/28",
  "10.167.90.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.90.64/28",
  "10.167.90.80/28",
  "10.167.90.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.90.112/28",
  "10.167.90.128/28",
  "10.167.90.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.90.160/28",
  "10.167.90.176/28",
  "10.167.90.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.90.208/28",
  "10.167.90.224/28",
  "10.167.90.240/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.91.0/28",
  "10.167.91.16/28",
  "10.167.91.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.91.48/28",
  "10.167.91.64/28",
  "10.167.91.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.91.96/28",
  "10.167.91.112/28",
  "10.167.91.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.91.144/28",
  "10.167.91.160/28",
  "10.167.91.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.91.192/28",
  "10.167.91.208/28",
  "10.167.91.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.91.240/28",
  "10.167.92.0/28",
  "10.167.92.16/28",
]

ibs_subnets_cidrs = [
  "10.167.92.32/28",
  "10.167.92.48/28",
  "10.167.92.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.92.80/28",
  "10.167.92.96/28",
  "10.167.92.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.92.128/28",
  "10.167.92.144/28",
  "10.167.92.160/28",
]

tars_backend_subnets_cidrs = [
  "10.167.93.0/27",
  "10.167.93.32/27",
  "10.167.93.64/27",
]

cpc_efs_subnets_cidrs = [
  "10.167.93.112/28",
  "10.167.93.128/28",
  "10.167.93.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.93.208/28",
  #  "10.167.93.224/28",
]

sftpplus_nlb_subnets_cidrs = [
  "10.167.94.32/28",
  "10.167.94.48/28",
  "10.167.94.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.94.80/28",
  "10.167.94.96/28",
  "10.167.94.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.94.128/28",
  "10.167.94.144/28",
  "10.167.94.160/28",
]

cpc_alb_internal = [
  "10.167.94.176/28",
  "10.167.94.192/28",
  "10.167.94.208/28",
]

bobj_subnets_cidrs = [
  "10.167.94.224/28",
  "10.167.94.240/28",
  "10.167.95.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.95.0/28",
  "10.167.95.16/28",
  "10.167.95.32/28",
]

batch_efs_subnets_cidrs = [
  "10.167.95.48/28",
  "10.167.95.64/28",
  "10.167.95.80/28",
]

prometheus_subnets_cidrs = [
  "10.167.95.96/28",
  "10.167.95.112/28",
  "10.167.95.128/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.95.144/28",
  "10.167.95.160/28",
  "10.167.95.176/28",
]

prometheus_alb_private_cidrs = [
  "10.167.95.192/28",
  "10.167.95.208/28",
  "10.167.95.224/28",
]

tars_lambda_subnets_cidrs = [
  "10.167.89.0/28",
  "10.167.89.16/28",
  "10.167.89.32/28",
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
tars_rds_snapshot          = "tars-uat03-core-tarsdb-08-01-2022-obfuscation-do-not-delete"



# CPCSDB
cpc_rds_username          = "cpcuatadmin"
cpc_rds_allocated_storage = "100"
cpc_rds_snapshot          = "tars-uat03-cpc-cpcdb-08-01-2022-obfuscation-do-not-delete"


# IBSDB
ibs_rds_username = "tarsuatadmin"

# MISDB
mis_rds_username                = "misuatadmin"
mis_rds_allocated_storage       = "440"
mis_rds_snapshot                = "tars-uat03-tars-reporting-misdb-08-01-2022-obfuscation-do-not-delete"
mis_rds_autoscale               = "False"
mis_allow_major_version_upgrade = true

# RSISDB
rsis_rds_username          = "rsisuatadmin"
rsis_rds_allocated_storage = "120"
rsis_rds_snapshot          = "tars-uat03-tars-reporting-rsisdb-08-01-2022-obfuscation-do-not-delete"
rsis_rds_autoscale         = "False"

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
wildfly-messaging_ebs_vol              = 100
wildfly-messaging_ebs_volume_type      = "gp3"

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "uat03.nonprod.tars.dev-dvsacloud.uk"

whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "10.201.80.0/21",     # DVSA Notts Internal
  "10.69.3.64/26",      # DVSA ZPA VPN
  "10.69.131.64/26",    # DVSA ZPA VPN
  "148.253.134.213/32", # BJSS VPN 04/18
  "54.72.37.158/32",    # Selenium Elasticgrid Proxy
  "199.83.128.0/21",    # Begin Incapsula IPs
  "198.143.32.0/19",
  "149.126.72.0/21",
  "103.28.248.0/22",
  "185.11.124.0/22",
  "192.230.64.0/18",
  "45.64.64.0/22",
  "107.154.0.0/16",
  "45.60.0.0/16",
  "131.125.128.0/17",# Incapsula New OPS-4858
  "45.223.0.0/16",   # End Incapsula IPs
  "54.76.206.25/32", # Perf01 NATGW IP
  "10.69.3.15/32",   # Begin DVSA MS-RDS
  "10.69.3.16/32",
  "10.69.3.17/32",
  "10.69.3.18/32",
  "10.69.1.70/31",
  "10.84.192.159/32",
  "10.84.192.161/32",  # End DVSA MS-RDS
  "85.115.53.201/32",  #DSCALLARDS
  "80.194.75.82/32",   #DSCALLARDS
  "34.242.28.119/32",  #MGMT Jenkins for url checks
  "194.75.245.154/32", # DAC Digital Access Centre
  "154.14.88.249/32",  # DVSA Notts Corp & Wifi
  "62.254.63.52/32",   # Kainos Zscaler
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

#Turn off Prometheus
prometheus_asg_max_size = 0

api_notify = {
  handler                = "notify.handleAsync"
  s3_key_prefix          = "lambda-repo/packages/gov-notify/tars-gov-notify"
  memory_size            = 128
  timeout                = 5
  publish                = false
  cwlg_retention_in_days = 3
  log_level              = "DEBUG"
}

# DocumentBatchUpdate - maximum records processed in the Job Polling
dbu_maxrecordsprocessed = 500

# Process Unknown Card Authorisations Job - Challenged Card Auth
puca_job_cca_minAgeHours                     = 1
puca_job_cca_maxAgeDays                      = 0
puca_job_cca_maxProcessed                    = 5
puca_job_cca_communicationError_minAgeHours  = 1
puca_job_cca_communicationError_maxAgeDays   = 0
puca_job_cca_communicationError_maxProcessed = 1
puca_job_cca_nonfinalepdqstatus_minAgeHours  = 1
puca_job_cca_nonfinalepdqstatus_maxAgeDays   = 60
puca_job_cca_nonfinalepdqstatus_maxProcessed = 2
puca_job_cca_maxRecordsPerJobRun             = 5 