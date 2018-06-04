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
vpc_cidr = "10.167.4.0/22"

jenkinsnode_subnets_cidrs = [
  "10.167.4.0/28",
  "10.167.4.16/28",
  "10.167.4.32/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.4.64/28",
  "10.167.4.80/28",
  "10.167.4.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.4.112/28",
  "10.167.4.128/28",
  "10.167.4.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.4.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.4.176/28",
]

### SHOULD be 10.167.5.208 etc
jmeter_subnets_cidrs = [
  "10.167.4.208/28",
  "10.167.4.224/28",
  "10.167.4.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.5.0/27",
  "10.167.5.32/27",
  "10.167.5.64/27",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.5.144/28",
  "10.167.5.160/28",
  "10.167.5.176/28",
]

## tardis RDS subnets - 10.167.5.96/28, 10.167.5.112/28, 10.167.5.128/28

#SquidNAT CIDR Range
#TEMPORARY MUST CAHNGE to
#  "10.167.5.160/28",
#  "10.167.5.176/28",
#  "10.167.5.192/28",
squidnat_subnets_cidrs = [
  "10.167.5.192/28",
  "10.167.5.208/28",
  "10.167.5.224/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.6.0/26",
  "10.167.6.64/26",
  "10.167.6.128/26",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.6.192/28",
  "10.167.6.208/28",
  "10.167.6.224/28",
]

cpc_backend_subnets_cidrs = [
  "10.167.7.0/28",
  "10.167.7.16/28",
  "10.167.7.32/28",
]

cpc_frontend_subnets_cidrs = [
  "10.167.7.48/28",
  "10.167.7.60/28",
  "10.167.7.76/28",
]

elc_main_subnets_cidrs = [
  "10.167.7.96/28",
  "10.167.7.112/28",
  "10.167.7.128/28",
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

tars_rds_password = "password"

# TARSDB
tars_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
tars_rds_snapshot = "tars-testdb-210218"

#############################################################################
# Transit VPC peering
#############################################################################

transit_peering_enabled = true

#############################################################################
# DVSA AD VPC peering
#############################################################################

ad_peering_enabled = true
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# Target DMS RDS instances
target_dms_tars_rds_storage_type = "gp2"
target_dms_tars_rds_engine = "oracle-se2"
target_dms_tars_rds_engine_version = "12.1.0.2.v11"
target_dms_tars_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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

target_dms_cpc_rds_storage_type = "gp2"
target_dms_cpc_rds_engine = "oracle-se2"
target_dms_cpc_rds_engine_version = "12.1.0.2.v11"
target_dms_cpc_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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

target_dms_rsis_rds_storage_type = "gp2"
target_dms_rsis_rds_engine = "oracle-se2"
target_dms_rsis_rds_engine_version = "12.1.0.2.v11"
target_dms_rsis_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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

target_dms_mis_rds_storage_type = "gp2"
target_dms_mis_rds_engine = "oracle-se2"
target_dms_mis_rds_engine_version = "12.1.0.2.v11"
target_dms_mis_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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

# Source DMS RDS instances
source_dms_tars_rds_storage_type = "gp2"
source_dms_tars_rds_engine = "oracle-se2"
source_dms_tars_rds_engine_version = "12.1.0.2.v11"
source_dms_tars_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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
source_dms_tars_rds_username = "tarsdmsadmin"
source_dms_tars_rds_password = "password"
source_dms_tars_rds_allocated_storage = "300"
source_dms_tars_rds_name = "TARSDB"
source_dms_tars_rds_snapshot = "tarsuat-050418"

source_dms_cpc_rds_storage_type = "gp2"
source_dms_cpc_rds_engine = "oracle-se2"
source_dms_cpc_rds_engine_version = "12.1.0.2.v11"
source_dms_cpc_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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
source_dms_cpc_rds_username = "cpcdmsadmin"
source_dms_cpc_rds_password = "password"
source_dms_cpc_rds_allocated_storage = "100"
source_dms_cpc_rds_name = "CPCDB"
source_dms_cpc_rds_snapshot = "rds:cpcuat01-2018-05-25-00-31"

source_dms_rsis_rds_storage_type = "gp2"
source_dms_rsis_rds_engine = "oracle-se2"
source_dms_rsis_rds_engine_version = "12.1.0.2.v11"
source_dms_rsis_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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
source_dms_rsis_rds_username = "rsisdmsadmin"
source_dms_rsis_rds_password = "password"
source_dms_rsis_rds_allocated_storage = "80"
source_dms_rsis_rds_name = "RSISDB"
source_dms_rsis_rds_snapshot = "rds:tarsrsis01-2018-05-24-23-18"

source_dms_mis_rds_storage_type = "gp2"
source_dms_mis_rds_engine = "oracle-se2"
source_dms_mis_rds_engine_version = "12.1.0.2.v11"
source_dms_mis_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
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
source_dms_mis_rds_username = "misdmsadmin"
source_dms_mis_rds_password = "password"
source_dms_mis_rds_allocated_storage = "300"
source_dms_mis_rds_name = "MISDB"
source_dms_mis_rds_snapshot = "misuat01-060418"
