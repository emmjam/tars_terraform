##########
# GENERAL
##############################################################################
project = "tars"

environment = "uat02"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "mes"
  Environment = "uat02"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "mes"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "uat02"
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
# uat02
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.48.0/21"

vpc_endpoint_subnets_cidrs = [
  "10.167.53.160/28",
  "10.167.53.176/28",
  "10.167.53.192/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.48.0/27",
  "10.167.48.32/27",
  "10.167.48.64/27",
]

tars_alb_internal = [
  "10.167.48.96/28",
  "10.167.48.112/28",
  "10.167.48.128/28",
]

obs_alb_internal = [
  "10.167.48.144/28",
  "10.167.48.160/28",
  "10.167.48.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.48.192/28",
  "10.167.48.208/28",
  "10.167.48.224/28",
]

nat_subnets_cidrs = [
  "10.167.48.240/28",
]

elc_main_subnets_cidrs = [
  "10.167.49.48/28",
  "10.167.49.64/28",
  "10.167.49.80/28",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.49.96/28",
  "10.167.49.112/28",
  "10.167.49.128/28",
]

tars_messaging_alb_subnets_cidrs = [
  "10.167.49.176/28",
  "10.167.49.192/28",
  "10.167.49.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.49.224/28",
  "10.167.49.240/28",
  "10.167.50.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.50.16/28",
  "10.167.50.32/28",
  "10.167.50.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.50.64/28",
  "10.167.50.80/28",
  "10.167.50.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.50.112/28",
  "10.167.50.128/28",
  "10.167.50.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.50.160/28",
  "10.167.50.176/28",
  "10.167.50.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.50.208/28",
  "10.167.50.224/28",
  "10.167.50.240/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.51.0/28",
  "10.167.51.16/28",
  "10.167.51.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.51.48/28",
  "10.167.51.64/28",
  "10.167.51.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.51.96/28",
  "10.167.51.112/28",
  "10.167.51.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.51.144/28",
  "10.167.51.160/28",
  "10.167.51.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.51.192/28",
  "10.167.51.208/28",
  "10.167.51.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.51.240/28",
  "10.167.52.0/28",
  "10.167.52.16/28",
]

ibs_subnets_cidrs = [
  "10.167.52.32/28",
  "10.167.52.48/28",
  "10.167.52.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.52.80/28",
  "10.167.52.96/28",
  "10.167.52.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.52.128/28",
  "10.167.52.144/28",
  "10.167.52.160/28",
]

tars_backend_subnets_cidrs = [
  "10.167.53.0/27",
  "10.167.53.32/27",
  "10.167.53.64/27",
]

cpc_efs_subnets_cidrs = [
  "10.167.53.112/28",
  "10.167.53.128/28",
  "10.167.53.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.53.208/28",
  #  "10.167.53.224/28",
]

sftpplus_nlb_subnets_cidrs = [
  "10.167.54.32/28",
  "10.167.54.48/28",
  "10.167.54.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.54.80/28",
  "10.167.54.96/28",
  "10.167.54.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.54.128/28",
  "10.167.54.144/28",
  "10.167.54.160/28",
]

cpc_alb_internal = [
  "10.167.54.176/28",
  "10.167.54.192/28",
  "10.167.54.208/28",
]

bobj_subnets_cidrs = [
  "10.167.54.224/28",
  "10.167.54.240/28",
  "10.167.55.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.55.0/28",
  "10.167.55.16/28",
  "10.167.55.32/28",
]

batch_efs_subnets_cidrs = [
  "10.167.55.48/28",
  "10.167.55.64/28",
  "10.167.55.80/28",
]

prometheus_subnets_cidrs = [
  "10.167.55.96/28",
  "10.167.55.112/28",
  "10.167.55.128/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.55.144/28",
  "10.167.55.160/28",
  "10.167.55.176/28",
]

prometheus_alb_private_cidrs = [
  "10.167.55.192/28",
  "10.167.55.208/28",
  "10.167.55.224/28",
]

tars_lambda_subnets_cidrs = [
  "10.167.49.0/28",
  "10.167.49.16/28",
  "10.167.49.32/28",
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
tars_rds_allocated_storage = "300"
tars_rds_snapshot          = "tars-core-tarsdb-20190410-5-4-0-1"
tars_rds_backup_retention  = "21"


# CPCSDB
cpc_rds_username          = "cpcadmin"
cpc_rds_allocated_storage = "100"
cpc_rds_snapshot          = "tars-uat01-cpc-cpcdb-20181108"
cpc_rds_backup_retention  = "21"

# IBSDB
ibs_rds_username = "tarsuatadmin"
ibs_rds_snapshot = "uat01-ibs-subnet-move"

# MISDB
mis_rds_username          = "misdmsadmin"
mis_rds_allocated_storage = "300"
mis_rds_snapshot          = "tars-uat01-tars-reporting-misdb-20181108"
mis_rds_autoscale         = "False"
mis_rds_backup_retention  = "21"

# RSISDB
rsis_rds_username                = "tarsrsisadmin"
rsis_rds_allocated_storage       = "300"
rsis_rds_snapshot                = "tars-uat01-tars-reporting-rsisdb-20181108"
rsis_rds_autoscale               = "False"
rsis_rds_backup_retention        = "21"

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

private_cert_domain_name = "uat02.nonprod.tars.dev-dvsacloud.uk"

# Temporary allocation -
# To be removed when overall range is increased
apache_subnet_cidrs = [
  "10.167.52.224/28",
  "10.167.52.240/28",
  "10.167.53.96/28",
]

mes_db_cidr_block = [
  "10.141.120.32/28",
  "10.141.120.48/28",
]
mes_api_cidr_block = [
  "10.141.120.160/28",
  "10.141.120.176/28",
  "10.141.120.192/28",
  "10.141.120.208/28",
]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = true

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled                  = false
rds_cw_metric_freestoragespace_alarm_action_enabled = true

# IBSDB Concurrent Users Monitoring
ibsdb_monitoring_enabled = true

run-flag-lambda-holding-pages = "true" # controls deployment of holding pages lambda module

# Extra domains that the CloudFront distribution for
# maintenance pages should be aware of.
holding_pages_domains = [
  "incapsula-uat02-public.dvsa.tars.dev-dvsacloud.uk",
  "incapsula-ibs-uat02-public.dvsa.tars.dev-dvsacloud.uk",
]

api_notify = {
  handler                = "notify.handleAsync"
  s3_key_prefix          = "lambda-repo/packages/gov-notify/tars-gov-notify"
  memory_size            = 128
  timeout                = 5
  publish                = false
  cwlg_retention_in_days = 3
  log_level              = "DEBUG"
}

# reporting xe
reporting_xe_count            = 1
reporting_xe_asg_min_size     = 0
reporting_xe_asg_max_size     = 1
reporting_xe_asg_desired_size = 1
reporting_xe_subnets_cidrs = [
  "10.167.53.240/28",
  "10.167.54.0/28",
  "10.167.54.16/28",
]

reporting_xe_subnet_cidr = ["10.167.53.240/28"]


whitelist = [
  "135.196.73.204/32",  # DVSA Notts
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
  "45.223.0.0/16",    # End Incapsula IPs
  "54.76.206.25/32",  # Perf01 NATGW IP
  "52.214.31.165/32", #Nonprod NATGW IP
  "10.69.3.15/32",    # Begin DVSA MS-RDS
  "10.69.3.16/32",
  "10.69.3.17/32",
  "10.69.3.18/32",
  "10.69.1.70/31",
  "10.84.192.159/32",
  "10.84.192.161/32",  # End DVSA MS-RDS
  "85.115.53.201/32",  #DSCALLARDS
  "80.194.75.82/32",   #DSCALLARDS
  "34.242.28.119/32",  #MGMT Jenkins for url checks
  "154.14.88.249/32",  # DVSA Notts Corp & Wifi
  "90.155.48.192/26",  # cyberis IPs for ITHC
  "81.2.127.144/28",   # cyberis IPs for ITHC
  "81.187.169.170/32", # cyberis IPs for ITHC
  "88.97.60.11/32",    # cyberis IPs for ITHC
  "3.10.4.97/32",      # cyberis IPs for ITHC
]

# DocumentBatchUpdate - maximum records processed in the Job Polling
dbu_maxrecordsprocessed = 500

# Whether to create obs Register New Business Holding resources
obs_reg_holding = true