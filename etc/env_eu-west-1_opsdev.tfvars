##########
# GENERAL
##############################################################################
project = "tars"

environment = "opsdev"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "opsdev"
  DVSA_Env    = "dev"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "opsdev"
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
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.0.0/21"

## endpoint cidr
vpc_endpoint_subnets_cidrs = [
  "10.167.5.160/28",
  "10.167.5.176/28",
  "10.167.5.192/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.0.0/27",
  "10.167.0.32/27",
  "10.167.0.64/27",
]

tars_alb_internal = [
  "10.167.0.96/28",
  "10.167.0.112/28",
  "10.167.0.128/28",
]

obs_alb_internal = [
  "10.167.0.144/28",
  "10.167.0.160/28",
  "10.167.0.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.0.192/28",
  "10.167.0.208/28",
  "10.167.0.224/28",
]

nat_subnets_cidrs = [
  "10.167.0.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.1.0/27",
  "10.167.1.32/27",
  "10.167.1.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.1.96/28",
  "10.167.1.112/28",
  "10.167.1.128/28",
]

tars_messaging_alb_subnets_cidrs = [
  "10.167.1.176/28",
  "10.167.1.192/28",
  "10.167.1.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.1.224/28",
  "10.167.1.240/28",
  "10.167.2.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.2.16/28",
  "10.167.2.32/28",
  "10.167.2.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.2.64/28",
  "10.167.2.80/28",
  "10.167.2.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.2.112/28",
  "10.167.2.128/28",
  "10.167.2.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.2.160/28",
  "10.167.2.176/28",
  "10.167.2.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.2.208/28",
  "10.167.2.224/28",
  "10.167.2.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.3.0/28",
  "10.167.3.16/28",
  "10.167.3.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.3.48/28",
  "10.167.3.64/28",
  "10.167.3.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.3.96/28",
  "10.167.3.112/28",
  "10.167.3.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.3.144/28",
  "10.167.3.160/28",
  "10.167.3.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.3.192/28",
  "10.167.3.208/28",
  "10.167.3.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.3.240/28",
  "10.167.4.0/28",
  "10.167.4.16/28",
]

ibs_subnets_cidrs = [
  "10.167.4.32/28",
  "10.167.4.48/28",
  "10.167.4.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.4.80/28",
  "10.167.4.96/28",
  "10.167.4.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.4.128/28",
  "10.167.4.144/28",
  "10.167.4.160/28",
]

elc_main_subnets_cidrs = [
  "10.167.5.16/28",
  "10.167.5.32/28",
  "10.167.5.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.5.64/28",
  "10.167.5.80/28",
  "10.167.5.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.5.112/28",
  "10.167.5.128/28",
  "10.167.5.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.5.208/28",
]

sftpplus_nlb_subnets_cidrs = [
  "10.167.6.32/28",
  "10.167.6.48/28",
  "10.167.6.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.6.80/28",
  "10.167.6.96/28",
  "10.167.6.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.6.128/28",
  "10.167.6.144/28",
  "10.167.6.160/28",
]

cpc_alb_internal = [
  "10.167.6.176/28",
  "10.167.6.192/28",
  "10.167.6.208/28",
]

bobj_subnets_cidrs = [
  "10.167.6.224/28",
  "10.167.6.240/28",
  "10.167.7.0/28",
]

prometheus_subnets_cidrs = [
  "10.167.7.16/28",
  "10.167.7.32/28",
  "10.167.7.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.7.64/28",
  "10.167.7.80/28",
  "10.167.7.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.7.112/28",
  "10.167.7.128/28",
  "10.167.7.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.7.160/28",
  "10.167.7.176/28",
  "10.167.7.192/28",
]

tars_lambda_subnets_cidrs = [
  "10.167.7.208/28",
  "10.167.7.224/28",
  "10.167.7.240/28",
]

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

# TARSDB
tars_rds_username          = "tarsdevadmin"
tars_rds_allocated_storage = "20"
tars_rds_snapshot          = "tars-opsdev-tars-core-tarsdb-5-4-2019-5-7-0-2"

# CPCSDB
cpc_rds_username          = "cpcdevadmin"
cpc_rds_allocated_storage = "50"
cpc_rds_snapshot          = "tars-opsdev-cpc-cpcdb-5-4-2019-5-7-0-2"


# IBSDB
ibs_rds_username = "ibsuatadmin"
ibs_rds_snapshot = "sit01-ibs-subnet-move"

# MISDB
mis_rds_username          = "misdmsadmin"
mis_rds_allocated_storage = "300"
mis_rds_snapshot          = "tars-dev01-tars-dms-misopdmstg-20180720"

# RSISDB
rsis_rds_username          = "tarsrsisadmin"
rsis_rds_allocated_storage = "80"
rsis_rds_snapshot          = "tars-dev01-tars-dms-rsisdmssc-20180719"

#############################################################################
# VPC to DVSA WAN via DX
#############################################################################

# New World
dvsa_wan_connectivity_enabled = false

# Old World
transit_peering_enabled = false

#############################################################################
# DVSA AD VPC peering
#############################################################################

ad_peering_enabled = false
ad_peering_vpc     = "vpc-02072cb35506d9b73"
ad_account         = "233824316563"

private_cert_domain_name = "dvsa.tars.dev-dvsacloud.uk"

mes_db_cidr_block = [
  "10.111.0.0/16",
  "10.222.0.0/27",
  "10.123.0.0/32",
]
mes_api_cidr_block = [
  "10.222.0.0/16",
  "10.76.123.0/32",
  "10.76.124.0/32",
]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = true

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled                  = false
rds_cw_metric_freestoragespace_alarm_action_enabled = true

# Enable action for AmazonMQ Queue CloudWatch Alarm
velocity_email_cw_metric_alarm_enabled           = true
mq_cw_metric_velocity_email_alarm_action_enabled = true
email_queue_cw_metric_alarm_enabled              = true
mq_cw_metric_email_queue_alarm_action_enabled    = true
print_queue_cw_metric_alarm_enabled              = true
mq_cw_metric_print_queue_alarm_action_enabled    = true

# Enable action for Sftp CPU CloudWatch Alarm
sftp_cpuutilization_cw_metric_alarm_enabled        = true
sftp_cpuutilization_cw_metric_alarm_action_enabled = true

# Enable action for tars-core CPU CloudWatch Alarm
tars_core_cpuutilization_cw_metric_alarm_enabled        = true
tars_core_cpuutilization_cw_metric_alarm_action_enabled = true

api_notify = {
  handler = "notify.handleAsync"
  #s3_key_prefix          = "functions/notify"
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
reporting_xe_asg_max_size     = 0
reporting_xe_asg_desired_size = 0
reporting_xe_subnets_cidrs = [
  "10.167.4.176/28",
  "10.167.4.192/28",
  "10.167.4.208/28",
]
reporting_xe_subnet_cidr = ["10.167.4.176/28"]

# DocumentBatchUpdate - maximum records processed in the Job Polling
dbu_maxrecordsprocessed = 500

# Whether to create obs Register New Business Holding resources
obs_reg_holding = true

# Process Unknown Card Authorisations Job - Challenged Card Auth
puca_job_cca_minAgeHours                     = 0
puca_job_cca_maxAgeDays                      = 0
puca_job_cca_maxProcessed                    = 5
puca_job_cca_communicationError_minAgeHours  = 0
puca_job_cca_communicationError_maxAgeDays   = 0
puca_job_cca_communicationError_maxProcessed = 1
puca_job_cca_nonfinalepdqstatus_minAgeHours  = 0
puca_job_cca_nonfinalepdqstatus_maxAgeDays   = 0
puca_job_cca_nonfinalepdqstatus_maxProcessed = 2
puca_job_cca_maxRecordsPerJobRun             = 5 


## jenkins
jenkins_instance_type        = "m5a.large"
jenkins_ami_build_id         = "1351"
jenkins_asg_min_size         = 0
jenkins_asg_max_size         = 1
jenkins_ebs_volume_type      = "gp3"
jenkins_ebs_volume_size      = 100
jenkins_blue_nodes_number    = 1
jenkins_scaledown_desired    = 1
jenkins_scaledown_recurrence = "00 19 * * 1-5"
jenkins_scaleup_desired      = 1
jenkins_scaleup_recurrence   = "00 07 * * 1-5"

jenkins_blue_subnets_cidrs = ["10.200.3.0/28"]

jenkins_blue_version = "2.332.3"

jenkins_elb_subnets_cidrs = ["10.200.3.32/28"]
jenkins_alb_subnets_cidrs = ["10.200.6.0/28", "10.200.6.16/28"]