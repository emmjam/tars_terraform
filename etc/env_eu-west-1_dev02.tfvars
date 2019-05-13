##########
# GENERAL
##############################################################################
project = "tars"

environment = "dev02"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "mes"
  Environment = "dev02"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "mes"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "dev02"
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
# dev02
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.40.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.40.0/27",
  "10.167.40.32/27",
  "10.167.40.64/27",
]

tars_alb_internal = [
  "10.167.40.96/28",
  "10.167.40.112/28",
  "10.167.40.128/28",
]

obs_alb_internal = [
  "10.167.40.144/28",
  "10.167.40.160/28",
  "10.167.40.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.40.192/28",
  "10.167.40.208/28",
  "10.167.40.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.40.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.41.0/27",
  "10.167.41.32/27",
  "10.167.41.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.41.96/28",
  "10.167.41.112/28",
  "10.167.41.128/28",
]

#  "10.167.41.144/28",
#  "10.167.41.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.41.176/28",
  "10.167.41.192/28",
  "10.167.41.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.41.224/28",
  "10.167.41.240/28",
  "10.167.42.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.42.16/28",
  "10.167.42.32/28",
  "10.167.42.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.42.64/28",
  "10.167.42.80/28",
  "10.167.42.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.42.112/28",
  "10.167.42.128/28",
  "10.167.42.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.42.160/28",
  "10.167.42.176/28",
  "10.167.42.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.42.208/28",
  "10.167.42.224/28",
  "10.167.42.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.43.0/28",
  "10.167.43.16/28",
  "10.167.43.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.43.48/28",
  "10.167.43.64/28",
  "10.167.43.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.43.96/28",
  "10.167.43.112/28",
  "10.167.43.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.43.144/28",
  "10.167.43.160/28",
  "10.167.43.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.43.192/28",
  "10.167.43.208/28",
  "10.167.43.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.43.240/28",
  "10.167.44.0/28",
  "10.167.44.16/28",
]

ibs_subnets_cidrs = [
  "10.167.44.32/28",
  "10.167.44.48/28",
  "10.167.44.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.44.80/28",
  "10.167.44.96/28",
  "10.167.44.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.44.128/28",
  "10.167.44.144/28",
  "10.167.44.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.44.176/28",
  "10.167.44.192/28",
  "10.167.44.208/28",
]

xenco_subnets_cidrs = [
  "10.167.44.224/28",
  "10.167.44.240/28",
  "10.167.45.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.45.16/28",
  "10.167.45.32/28",
  "10.167.45.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.45.64/28",
  "10.167.45.80/28",
  "10.167.45.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.45.112/28",
  "10.167.45.128/28",
  "10.167.45.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.45.160/28",
  "10.167.45.176/28",
  "10.167.45.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.45.208/28",
]

apache_subnet_cidrs = [
  "10.167.45.224/28",
  "10.167.45.240/28",
  "10.167.46.0/28",
]

#  "10.167.46.16/28",

# Now free to use
# test_database_subnets_cidrs = [
#   "10.167.46.32/27",
#   "10.167.46.64/27",
#   "10.167.46.96/27",
# ]

jmeter_subnets_cidrs = [
  "10.167.46.128/28",
  "10.167.46.144/28",
  "10.167.46.160/28",
]

cpc_alb_internal = [
  "10.167.46.176/28",
  "10.167.46.192/28",
  "10.167.46.208/28",
]

bobj_subnets_cidrs = [
  "10.167.46.224/28",
  "10.167.46.240/28",
  "10.167.47.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.47.16/28",
  "10.167.47.32/28",
  "10.167.47.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.47.64/28",
  "10.167.47.80/28",
  "10.167.47.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.47.112/28",
  "10.167.47.128/28",
  "10.167.47.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.47.160/28",
  "10.167.47.176/28",
  "10.167.47.192/28",
]

efs_backup_subnets_cidrs = [
  "10.167.47.208/28",
  "10.167.47.224/28",
  "10.167.47.240/28",
]

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"

mgmt_env = "mgmt"


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

# TARSDB - Copy of tars uat db for testing with MES
tars_rds_username = "tarsdevadmin"

tars_rds_password = "password"

# TARSDB
tars_rds_allocated_storage = "300"
tars_rds_snapshot = "tars-dev01-tars-core-tarsdb-5-4-2019-5-7-0-2"
tars_rds_autoscale = "False"

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "YwBWc8HvweT3Lun8"

# CPCTSDB
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-dev01-cpc-cpcdb-5-4-2019-5-7-0-2"


# IBSDB
ibs_rds_username = "ibsdevadmin"

ibs_rds_password = "password"

ibs_rds_snapshot = "dev02-ibs-subnet-move"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_password = "password"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_password = "password"
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

ad_peering_enabled = false
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# Target DMS RDS instances
target_dms_tars_rds_storage_type = "gp2"
target_dms_tars_rds_engine = "oracle-se2"
target_dms_tars_rds_engine_version = "12.1.0.2.v15"
target_dms_tars_rds_instance_class = "db.r4.xlarge" # was "db.m4.4xlarge"
target_dms_tars_rds_port = "1521"
target_dms_tars_rds_public = "true"
target_dms_tars_rds_multi_az = "false" # it takes an age to build if true
target_dms_tars_rds_backup_retention = "7"
target_dms_tars_rds_backup_window = "02:38-03:08"
target_dms_tars_rds_maint_window = "sun:03:16-sun:03:46"
target_dms_tars_rds_skip_final_snapshot = true
target_dms_tars_rds_apply_immediately = "true"
target_dms_tars_rds_license_model = "license-included"
target_dms_tars_rds_autoscale = "True"
target_dms_tars_rds_username = "tarsdmsadmin"
target_dms_tars_rds_password = "password"
target_dms_tars_rds_allocated_storage = "300"
target_dms_tars_rds_name = "TARSDB"
target_dms_tars_rds_snapshot = "tars-dev01-tars-dms-tarsdmstg-20180720"

target_dms_on_prem_tars_rds_snapshot = "tars-dms-target-180704"

target_dms_cpc_rds_storage_type = "gp2"
target_dms_cpc_rds_engine = "oracle-se2"
target_dms_cpc_rds_engine_version = "12.1.0.2.v15"
target_dms_cpc_rds_instance_class = "db.r4.large" # was "db.m4.4xlarge"
target_dms_cpc_rds_port = "1521"
target_dms_cpc_rds_public = "true"
target_dms_cpc_rds_multi_az = "false" # it takes an age to build if true
target_dms_cpc_rds_backup_retention = "7"
target_dms_cpc_rds_backup_window = "02:38-03:08"
target_dms_cpc_rds_maint_window = "sun:03:16-sun:03:46"
target_dms_cpc_rds_skip_final_snapshot = true
target_dms_cpc_rds_apply_immediately = "true"
target_dms_cpc_rds_license_model = "license-included"
target_dms_cpc_rds_autoscale = "True"
target_dms_cpc_rds_username = "cpcdmsadmin"
target_dms_cpc_rds_password = "password"
target_dms_cpc_rds_allocated_storage = "100"
target_dms_cpc_rds_name = "CPCDB"
target_dms_cpc_rds_snapshot = "tars-dev01-tars-dms-cpcdmstg-20180720"

target_dms_on_prem_cpc_rds_snapshot = "cpc-dms-target-180619"

target_dms_rsis_rds_storage_type = "gp2"
target_dms_rsis_rds_engine = "oracle-se2"
target_dms_rsis_rds_engine_version = "12.1.0.2.v15"
target_dms_rsis_rds_instance_class = "db.t2.medium" # was "db.m4.4xlarge"
target_dms_rsis_rds_port = "1521"
target_dms_rsis_rds_public = "true"
target_dms_rsis_rds_multi_az = "false" # it takes an age to build if true
target_dms_rsis_rds_backup_retention = "7"
target_dms_rsis_rds_backup_window = "02:38-03:08"
target_dms_rsis_rds_maint_window = "sun:03:16-sun:03:46"
target_dms_rsis_rds_skip_final_snapshot = true
target_dms_rsis_rds_apply_immediately = "true"
target_dms_rsis_rds_license_model = "license-included"
target_dms_rsis_rds_autoscale = "True"
target_dms_rsis_rds_username = "rsisdmsadmin"
target_dms_rsis_rds_password = "password"
target_dms_rsis_rds_allocated_storage = "80"
target_dms_rsis_rds_name = "RSISDB"
target_dms_rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmstg-20180720"

target_dms_on_prem_rsis_rds_snapshot = "rsis-dms-target-180628"

target_dms_mis_rds_storage_type = "gp2"
target_dms_mis_rds_engine = "oracle-se2"
target_dms_mis_rds_engine_version = "12.1.0.2.v15"
target_dms_mis_rds_instance_class = "db.t2.medium" # was "db.m4.4xlarge"
target_dms_mis_rds_port = "1521"
target_dms_mis_rds_public = "true"
target_dms_mis_rds_multi_az = "false" # it takes an age to build if true
target_dms_mis_rds_backup_retention = "7"
target_dms_mis_rds_backup_window = "02:38-03:08"
target_dms_mis_rds_maint_window = "sun:03:16-sun:03:46"
target_dms_mis_rds_skip_final_snapshot = true
target_dms_mis_rds_apply_immediately = "true"
target_dms_mis_rds_license_model = "license-included"
target_dms_mis_rds_autoscale = "True"
target_dms_mis_rds_username = "misdmsadmin"
target_dms_mis_rds_password = "password"
target_dms_mis_rds_allocated_storage = "300"
target_dms_mis_rds_name = "MISDB"
target_dms_mis_rds_snapshot = "tars-dev01-tars-dms-misdmstg-20180720"

target_dms_on_prem_mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

# Source DMS RDS instances
source_dms_tars_rds_storage_type = "gp2"
source_dms_tars_rds_engine = "oracle-se2"
source_dms_tars_rds_engine_version = "12.1.0.2.v15"
source_dms_tars_rds_instance_class = "db.t2.medium" # was "db.m4.4xlarge"
source_dms_tars_rds_port = "1521"
source_dms_tars_rds_public = "true"
source_dms_tars_rds_multi_az = "false" # it takes an age to build if true
source_dms_tars_rds_backup_retention = "7"
source_dms_tars_rds_backup_window = "02:38-03:08"
source_dms_tars_rds_maint_window = "sun:03:16-sun:03:46"
source_dms_tars_rds_skip_final_snapshot = true
source_dms_tars_rds_apply_immediately = "true"
source_dms_tars_rds_license_model = "license-included"
source_dms_tars_rds_autoscale = "True"
source_dms_tars_rds_username = "tarsuatadmin"
source_dms_tars_rds_password = "jZKS9PsapxXfkg8a"
source_dms_tars_rds_allocated_storage = "300"
source_dms_tars_rds_name = "TARSDB"
source_dms_tars_rds_snapshot = "tarsuatdms-07062018"

source_dms_cpc_rds_storage_type = "gp2"
source_dms_cpc_rds_engine = "oracle-se2"
source_dms_cpc_rds_engine_version = "12.1.0.2.v15"
source_dms_cpc_rds_instance_class = "db.t2.medium" # was "db.m4.4xlarge"
source_dms_cpc_rds_port = "1521"
source_dms_cpc_rds_public = "true"
source_dms_cpc_rds_multi_az = "false" # it takes an age to build if true
source_dms_cpc_rds_backup_retention = "7"
source_dms_cpc_rds_backup_window = "02:38-03:08"
source_dms_cpc_rds_maint_window = "sun:03:16-sun:03:46"
source_dms_cpc_rds_skip_final_snapshot = true
source_dms_cpc_rds_apply_immediately = "true"
source_dms_cpc_rds_license_model = "license-included"
source_dms_cpc_rds_autoscale = "True"
source_dms_cpc_rds_username = "cpcuatadmin"
source_dms_cpc_rds_password = "Mg28yDQjuEWndbtz"
source_dms_cpc_rds_allocated_storage = "100"
source_dms_cpc_rds_name = "CPCDB"
source_dms_cpc_rds_snapshot = "tars-dev01-tars-dms-cpcdmssc-20180720"

source_dms_rsis_rds_storage_type = "gp2"
source_dms_rsis_rds_engine = "oracle-se2"
source_dms_rsis_rds_engine_version = "12.1.0.2.v15"
source_dms_rsis_rds_instance_class = "db.t2.medium" # was "db.m4.4xlarge"
source_dms_rsis_rds_port = "1521"
source_dms_rsis_rds_public = "true"
source_dms_rsis_rds_multi_az = "false" # it takes an age to build if true
source_dms_rsis_rds_backup_retention = "7"
source_dms_rsis_rds_backup_window = "02:38-03:08"
source_dms_rsis_rds_maint_window = "sun:03:16-sun:03:46"
source_dms_rsis_rds_skip_final_snapshot = true
source_dms_rsis_rds_apply_immediately = "true"
source_dms_rsis_rds_license_model = "license-included"
source_dms_rsis_rds_autoscale = "True"
source_dms_rsis_rds_username = "tarsrsisadmin"
source_dms_rsis_rds_password = "FC2Vyu8ejnWCKfYU"
source_dms_rsis_rds_allocated_storage = "80"
source_dms_rsis_rds_name = "RSISDB"
source_dms_rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"

source_dms_mis_rds_storage_type = "gp2"
source_dms_mis_rds_engine = "oracle-se2"
source_dms_mis_rds_engine_version = "12.1.0.2.v15"
source_dms_mis_rds_instance_class = "db.t2.medium" # was "db.m4.4xlarge"
source_dms_mis_rds_port = "1521"
source_dms_mis_rds_public = "true"
source_dms_mis_rds_multi_az = "false" # it takes an age to build if true
source_dms_mis_rds_backup_retention = "7"
source_dms_mis_rds_backup_window = "02:38-03:08"
source_dms_mis_rds_maint_window = "sun:03:16-sun:03:46"
source_dms_mis_rds_skip_final_snapshot = true
source_dms_mis_rds_apply_immediately = "true"
source_dms_mis_rds_license_model = "license-included"
source_dms_mis_rds_autoscale = "True"
source_dms_mis_rds_username = "misuatadmin"
source_dms_mis_rds_password = "W53dBTJhdsdAuf3V"
source_dms_mis_rds_allocated_storage = "300"
source_dms_mis_rds_name = "MISDB"
source_dms_mis_rds_snapshot = "misuat01-060418"

# DMS Stuff
xe_role_name = "OracleXE"

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

private_cert_domain_name = "dev02.tars.dvsa.aws"

## Schedules
## wildfly-front
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 0
wildfly-front_scaledown_desired    = 0
wildfly-front_scaledown_recurrence = "00 18 * * 1-5"
wildfly-front_scaleup_desired      = 1
wildfly-front_scaleup_recurrence   = "10 07 * * 1-5"

## wildfly-back
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 0
wildfly-back_scaledown_desired    = 0
wildfly-back_scaledown_recurrence = "00 18 * * 1-5"
wildfly-back_scaleup_desired      = 0
wildfly-back_scaleup_recurrence   = "00 07 * * 1-5"

## wildfly-batch
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 0
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 18 * * 1-5"
wildfly-batch_scaleup_desired      = 0
wildfly-batch_scaleup_recurrence   = "00 07 * * 1-5"

## obs
obs_asg_min_size         = 0
obs_asg_max_size         = 1
obs_scaledown_desired    = 0
obs_scaledown_recurrence = "00 18 * * 1-5"
obs_scaleup_desired      = 1
obs_scaleup_recurrence   = "10 07 * * 1-5"

## ibs
ibs_asg_min_size         = 0
ibs_asg_max_size         = 1
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 18 * * 1-5"
ibs_scaleup_desired      = 1
ibs_scaleup_recurrence   = "10 07 * * 1-5"

## fyndi-f
fyndi-f_asg_min_size         = 0
fyndi-f_asg_max_size         = 1
fyndi-f_scaledown_desired    = 0
fyndi-f_scaledown_recurrence = "00 18 * * 1-5"
fyndi-f_scaleup_desired      = 1
fyndi-f_scaleup_recurrence   = "00 07 * * 1-5"

## fyndi_back
fyndi-b_asg_min_size         = 0
fyndi-b_asg_max_size         = 1
fyndi-b_scaledown_desired    = 0
fyndi-b_scaledown_recurrence = "00 18 * * 1-5"
fyndi-b_scaleup_desired      = 1
fyndi-b_scaleup_recurrence   = "00 07 * * 1-5"

## cpc-front
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 0
cpc-front_scaledown_desired    = 0
cpc-front_scaledown_recurrence = "00 18 * * 1-5"
cpc-front_scaleup_desired      = 1
cpc-front_scaleup_recurrence   = "10 07 * * 1-5"

## cpc-back
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 0
cpc-back_scaledown_desired    = 0
cpc-back_scaledown_recurrence = "00 18 * * 1-5"
cpc-back_scaleup_desired      = 1
cpc-back_scaleup_recurrence   = "10 07 * * 1-5"

## wildfly-mock
wildfly-mock_asg_min_size         = 0
wildfly-mock_asg_max_size         = 1
wildfly-mock_scaledown_desired    = 0
wildfly-mock_scaledown_recurrence = "00 18 * * 1-5"
wildfly-mock_scaleup_desired      = 1
wildfly-mock_scaleup_recurrence   = "00 07 * * 1-5"

apache_ami_build_id = 548

mes_cidr_block = ["10.21.0.0/16"]