##########
# GENERAL
##############################################################################
project = "tars"

environment = "perf01"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "perf01"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "perf01"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "nonprod"
    "propagate_at_launch" = "true"
  }
]

###############################################################################
# BASE
###############################################################################

#Monitoring
prometheus_asg_min_size           = 1
prometheus_asg_max_size           = 1
prometheus_instance_type          = "t2.medium"
prometheus_ami_build_id           = 296
prometheus_efs_provisioned_mibps  = 1

#EFS Backups
efs_backup_asg_min_size           = 0
efs_backup_asg_max_size           = 0
efs_backup_instance_type          = "t3.nano"
efs_backup_ami_build_id           = 309

###############################################################################
# CTRL
###############################################################################

###############################################################################
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.32.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.32.0/26",
  "10.167.32.64/26",
  "10.167.32.128/26",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.32.192/28",
  "10.167.32.208/28",
  "10.167.32.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.32.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.33.0/27",
  "10.167.33.32/27",
  "10.167.33.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.33.96/28",
  "10.167.33.112/28",
  "10.167.33.128/28",
]

#  "10.167.33.144/28",
#  "10.167.33.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.33.176/28",
  "10.167.33.192/28",
  "10.167.33.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.33.224/28",
  "10.167.33.240/28",
  "10.167.34.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.34.16/28",
  "10.167.34.32/28",
  "10.167.34.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.34.64/28",
  "10.167.34.80/28",
  "10.167.34.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.34.112/28",
  "10.167.34.128/28",
  "10.167.34.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.34.160/28",
  "10.167.34.176/28",
  "10.167.34.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.34.208/28",
  "10.167.34.224/28",
  "10.167.34.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.35.0/28",
  "10.167.35.16/28",
  "10.167.35.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.35.48/28",
  "10.167.35.64/28",
  "10.167.35.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.35.96/28",
  "10.167.35.112/28",
  "10.167.35.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.35.144/28",
  "10.167.35.160/28",
  "10.167.35.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.35.192/28",
  "10.167.35.208/28",
  "10.167.35.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.35.240/28",
  "10.167.36.0/28",
  "10.167.36.16/28",
]

ibs_subnets_cidrs = [
  "10.167.36.32/28",
  "10.167.36.48/28",
  "10.167.36.64/28",
]

ibs_db_subnets_cidrs = [
  "10.167.36.80/28",
  "10.167.36.96/28",
  "10.167.36.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.36.128/28",
  "10.167.36.144/28",
  "10.167.36.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.36.176/28",
  "10.167.36.192/28",
  "10.167.36.208/28",
]

xenco_subnets_cidrs = [
  "10.167.36.224/28",
  "10.167.36.240/28",
  "10.167.37.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.37.16/28",
  "10.167.37.32/28",
  "10.167.37.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.37.64/28",
  "10.167.37.80/28",
  "10.167.37.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.37.112/28",
  "10.167.37.128/28",
  "10.167.37.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.37.160/28",
  "10.167.37.176/28",
  "10.167.37.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.37.208/28",
#  "10.167.37.224/28",
#  "10.167.37.240/28",
]

#  "10.167.38.0/28",
#  "10.167.38.16/28",

test_database_subnets_cidrs = [
  "10.167.38.32/27",
  "10.167.38.64/27",
  "10.167.38.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.38.128/28",
  "10.167.38.144/28",
  "10.167.38.160/28",
]

third_party_subnets_cidrs = [
  "10.167.38.176/28",
  "10.167.38.192/28",
  "10.167.38.208/28",
]

owasp_subnets_cidrs = [
  "10.167.38.224/28",
  "10.167.38.240/28",
  "10.167.39.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.39.16/28",
  "10.167.39.32/28",
  "10.167.39.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.39.64/28",
  "10.167.39.80/28",
  "10.167.39.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.39.112/28",
  "10.167.39.128/28",
  "10.167.39.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.39.160/28",
  "10.167.39.176/28",
  "10.167.39.192/28",
]

efs_backup_subnets_cidrs = [
  "10.167.39.208/28",
  "10.167.39.224/28",
  "10.167.39.240/28",
]

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
tars_rds_allocated_storage = "300"
tars_rds_snapshot = "tars-perf01-tars-core-tarsdb-20180720"

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "Mg28yDQjuEWndbtz"

# MISDB
mis_rds_username = "misuatadmin"
mis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"
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
rsis_rds_username = "rsisuatadmin"
rsis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
rsis_rds_allocated_storage = "300"
rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"
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
cpc_rds_snapshot = "tars-opsdev-cpc-cpcdb-20180720"

# IBSDB
ibs_rds_username = "ibsuatadmin"

ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

ibs_rds_snapshot = "perf01-ibsdb-with-users-and-geo-data"

wildfly-back_instance_type  = "m4.large"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 2
wildfly-back_scaledown_desired    = 2
wildfly-back_scaledown_recurrence = "00 16 * * 1-7"
wildfly-back_scaleup_desired      = 2
wildfly-back_scaleup_recurrence   = "00 04 * * 1-7"

## wildfly-batch
wildfly-batch_instance_type  = "m4.large"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 1
wildfly-batch_scaledown_recurrence = "00 16 * * 1-7"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 04 * * 1-7"

## obs
obs_instance_type  = "m4.large"
obs_asg_min_size         = 0
obs_asg_max_size         = 2
obs_scaledown_desired    = 2
obs_scaledown_recurrence = "00 16 * * 1-7"
obs_scaleup_desired      = 2
obs_scaleup_recurrence   = "00 04 * * 1-7"

## ibs
ibs_instance_type  = "m4.large"
ibs_asg_min_size         = 0
ibs_asg_max_size         = 2
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 16 * * 1-7"
ibs_scaleup_desired      = 2
ibs_scaleup_recurrence   = "10 04 * * 1-7"

## wildfly-front
wildfly-front_instance_type  = "m4.large"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 2
wildfly-front_scaledown_desired    = 2
wildfly-front_scaledown_recurrence = "00 16 * * 1-7"
wildfly-front_scaleup_desired      = 2
wildfly-front_scaleup_recurrence   = "00 04 * * 1-7"

## wildfly-messaging
wildfly-messaging_instance_type  = "m4.large"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 1
wildfly-messaging_scaledown_desired    = 1
wildfly-messaging_scaledown_recurrence = "00 16 * * 1-7"
wildfly-messaging_scaleup_desired      = 1
wildfly-messaging_scaleup_recurrence   = "00 04 * * 1-7"

## cpc-back
cpc-back_instance_type  = "m4.large"
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 2
cpc-back_scaledown_desired    = 2
cpc-back_scaledown_recurrence = "00 16 * * 1-7"
cpc-back_scaleup_desired      = 2
cpc-back_scaleup_recurrence   = "00 04 * * 1-7"

## cpc-front
cpc-front_instance_type  = "m4.large"
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 2
cpc-front_scaledown_desired    = 2
cpc-front_scaledown_recurrence = "00 16 * * 1-7"
cpc-front_scaleup_desired      = 2
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
tars_rds_autoscale = "True"

## wildfly-mock
wildfly-mock_instance_type  = "t2.medium"
wildfly-mock_asg_min_size         = 0
wildfly-mock_asg_max_size         = 1
wildfly-mock_scaledown_desired    = 1
wildfly-mock_scaledown_recurrence = "00 16 * * 1-7"
wildfly-mock_scaleup_desired      = 1
wildfly-mock_scaleup_recurrence   = "00 04 * * 1-7"

##  JMeter
jmeter_instance_type              = "m5.large"
jmeter_asg_size_desired_on_create = 0
jmeter_asg_size_max               = 3
jmeter_asg_size_min               = 0

# squidnat
squidnat_instance_type = "m5.large"

private_cert_domain_name = "perf01.tars.dvsa.aws"
cpc_cert    = "*"
fyndi_cert  = "*"
tars_cert   = "*"
obs_cert    = "*"
ibs_cert    = "*"
