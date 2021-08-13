##########
# GENERAL
##############################################################################
project = "tars"

environment = "perf02"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "perf02"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "perf02"
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
vpc_cidr = "10.167.72.0/21"

vpc_endpoint_subnets_cidrs = [
  "10.167.77.160/28",
  "10.167.77.176/28",
  "10.167.77.192/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.72.0/27",
  "10.167.72.32/27",
  "10.167.72.64/27",
]

tars_alb_internal = [
  "10.167.72.96/28",
  "10.167.72.112/28",
  "10.167.72.128/28",
]

obs_alb_internal = [
  "10.167.72.144/28",
  "10.167.72.160/28",
  "10.167.72.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.72.192/28",
  "10.167.72.208/28",
  "10.167.72.224/28",
]

nat_subnets_cidrs = [
  "10.167.72.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.73.0/27",
  "10.167.73.32/27",
  "10.167.73.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.73.96/28",
  "10.167.73.112/28",
  "10.167.73.128/28",
]

tars_messaging_alb_subnets_cidrs = [
  "10.167.73.176/28",
  "10.167.73.192/28",
  "10.167.73.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.73.224/28",
  "10.167.73.240/28",
  "10.167.74.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.74.16/28",
  "10.167.74.32/28",
  "10.167.74.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.74.64/28",
  "10.167.74.80/28",
  "10.167.74.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.74.112/28",
  "10.167.74.128/28",
  "10.167.74.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.74.160/28",
  "10.167.74.176/28",
  "10.167.74.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.74.208/28",
  "10.167.74.224/28",
  "10.167.74.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.75.0/28",
  "10.167.75.16/28",
  "10.167.75.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.75.48/28",
  "10.167.75.64/28",
  "10.167.75.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.75.96/28",
  "10.167.75.112/28",
  "10.167.75.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.75.144/28",
  "10.167.75.160/28",
  "10.167.75.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.75.192/28",
  "10.167.75.208/28",
  "10.167.75.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.75.240/28",
  "10.167.76.0/28",
  "10.167.76.16/28",
]

ibs_subnets_cidrs = [
  "10.167.76.32/28",
  "10.167.76.48/28",
  "10.167.76.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.76.80/28",
  "10.167.76.96/28",
  "10.167.76.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.76.128/28",
  "10.167.76.144/28",
  "10.167.76.160/28",
]

elc_main_subnets_cidrs = [
  "10.167.77.16/28",
  "10.167.77.32/28",
  "10.167.77.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.77.64/28",
  "10.167.77.80/28",
  "10.167.77.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.77.112/28",
  "10.167.77.128/28",
  "10.167.77.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.77.208/28",
]

apache_subnet_cidrs = [
  "10.167.77.224/28",
  "10.167.77.240/28",
  "10.167.78.0/28",
]

tars_backend_api_alb_subnets_cidrs = [
   "10.167.78.32/27",
   "10.167.78.64/27",
   "10.167.78.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.78.128/28",
  "10.167.78.144/28",
  "10.167.78.160/28",
]

cpc_alb_internal = [
  "10.167.78.176/28",
  "10.167.78.192/28",
  "10.167.78.208/28",
]

bobj_subnets_cidrs = [
  "10.167.78.224/28",
  "10.167.78.240/28",
  "10.167.79.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.79.16/28",
  "10.167.79.32/28",
  "10.167.79.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.79.64/28",
  "10.167.79.80/28",
  "10.167.79.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.79.112/28",
  "10.167.79.128/28",
  "10.167.79.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.79.160/28",
  "10.167.79.176/28",
  "10.167.79.192/28",
]

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

#############################################################################
# VPC to DVSA WAN via DX
#############################################################################

# New World
dvsa_wan_connectivity_enabled = false

# Old World
transit_peering_enabled = true

# TARSDB
tars_rds_username = "tarsuatadmin"
tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
tars_rds_allocated_storage = "500"
tars_rds_snapshot = ""

# CPCSDB
cpc_rds_username = "tarscpcadmin"
cpc_rds_password = "Mg28yDQjuEWndbtz"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = ""
mis_rds_storage_type = "gp2"
mis_rds_instance_class = "db.m4.xlarge" # was "db.m4.4xlarge"
mis_rds_public = "false"
mis_rds_multi_az = "false" # it takes an age to build if true
mis_rds_backup_retention = "7"
mis_rds_backup_window = "02:38-03:08"
mis_rds_maint_window = "sun:03:16-sun:03:46"
mis_rds_skip_final_snapshot = true
mis_rds_apply_immediately = "true"
mis_rds_autoscale = "True"

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
rsis_rds_allocated_storage = "300"
rsis_rds_snapshot = ""
rsis_rds_storage_type = "gp2"
rsis_rds_instance_class = "db.m4.xlarge" # was "db.m4.4xlarge"
rsis_rds_public = "false"
rsis_rds_multi_az = "false" # it takes an age to build if true
rsis_rds_backup_retention = "7"
rsis_rds_backup_window = "02:38-03:08"
rsis_rds_maint_window = "sun:03:16-sun:03:46"
rsis_rds_skip_final_snapshot = true
rsis_rds_apply_immediately = "true"
rsis_rds_autoscale = "True"

# CPCTSDB
cpc_rds_allocated_storage = "100" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = ""

# IBSDB
ibs_rds_username = "ibsuatadmin"
ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
ibs_rds_snapshot = ""

wildfly-back_instance_type  = "m4.large"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 0
wildfly-back_scaledown_desired    = 0
wildfly-back_scaledown_recurrence = "00 16 * * 1-7"
wildfly-back_scaleup_desired      = 0
wildfly-back_scaleup_recurrence   = "00 04 * * 1-7"

## wildfly-batch
wildfly-batch_instance_type  = "m4.large"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 0
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 16 * * 1-7"
wildfly-batch_scaleup_desired      = 0
wildfly-batch_scaleup_recurrence   = "00 04 * * 1-7"

## obs
obs_instance_type  = "m4.large"
obs_asg_min_size         = 0
obs_asg_max_size         = 0
obs_scaledown_desired    = 0
obs_scaledown_recurrence = "00 16 * * 1-7"
obs_scaleup_desired      = 0
obs_scaleup_recurrence   = "00 04 * * 1-7"

## ibs
ibs_instance_type  = "m4.large"
ibs_asg_min_size         = 0
ibs_asg_max_size         = 0
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 16 * * 1-7"
ibs_scaleup_desired      = 0
ibs_scaleup_recurrence   = "10 04 * * 1-7"

## wildfly-front
wildfly-front_instance_type  = "m4.large"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 0
wildfly-front_scaledown_desired    = 0
wildfly-front_scaledown_recurrence = "00 16 * * 1-7"
wildfly-front_scaleup_desired      = 0
wildfly-front_scaleup_recurrence   = "00 04 * * 1-7"

## wildfly-messaging
wildfly-messaging_instance_type  = "m4.large"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 0
wildfly-messaging_scaledown_desired    = 0
wildfly-messaging_scaledown_recurrence = "00 16 * * 1-7"
wildfly-messaging_scaleup_desired      = 0
wildfly-messaging_scaleup_recurrence   = "00 04 * * 1-7"

## cpc-back
cpc-back_instance_type  = "m4.large"
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 0
cpc-back_scaledown_desired    = 0
cpc-back_scaledown_recurrence = "00 16 * * 1-7"
cpc-back_scaleup_desired      = 0
cpc-back_scaleup_recurrence   = "00 04 * * 1-7"

## cpc-front
cpc-front_instance_type  = "m4.large"
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 0
cpc-front_scaledown_desired    = 0
cpc-front_scaledown_recurrence = "00 16 * * 1-7"
cpc-front_scaleup_desired      = 0
cpc-front_scaleup_recurrence   = "00 04 * * 1-7"

## AWS MQ
aws_mq_host_instance_type      = "mq.t2.micro"
aws_mq_deployment_mode         = "SINGLE_INSTANCE"

# TARSDB
tars_rds_storage_type = "gp2"
tars_rds_instance_class = "db.m4.xlarge" # was "db.m4.4xlarge"
tars_rds_public = "false"
tars_rds_multi_az = "false" # it takes an age to build if true
tars_rds_backup_retention = "7"
tars_rds_backup_window = "02:38-03:08"
tars_rds_maint_window = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately = "true"

## wildfly-mock
wildfly-mock_instance_type  = "t2.medium"
wildfly-mock_asg_min_size         = 0
wildfly-mock_asg_max_size         = 0
wildfly-mock_scaledown_desired    = 0
wildfly-mock_scaledown_recurrence = "00 16 * * 1-7"
wildfly-mock_scaleup_desired      = 0
wildfly-mock_scaleup_recurrence   = "00 04 * * 1-7"

## apache
apache_instance_type         = "m4.large"
apache_asg_min_size          = 0
apache_asg_max_size          = 0
apache_scaledown_desired     = 0
apache_scaledown_recurrence  = "00 22 * * 1-5"
apache_scaleup_desired       = 0
apache_scaleup_recurrence    = "00 07 * * 1-5"


##  JMeter
jmeter_instance_type              = "m5d.large"
jmeter_asg_size_desired_on_create = 0
jmeter_asg_size_max               = 6
jmeter_asg_size_min               = 0

# squidnat
squidnat_instance_type = "m5.large"

private_cert_domain_name = "perf02.tars.dvsa.aws"

mes_db_cidr_block = [
  "10.21.110.32/28",
  "10.21.110.48/28",
]
mes_api_cidr_block = [
  "10.21.110.160/28",
  "10.21.110.176/28",
  "10.21.110.192/28",
  "10.21.110.208/28",
]
# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = true

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled = false
rds_cw_metric_freestoragespace_alarm_action_enabled = true
