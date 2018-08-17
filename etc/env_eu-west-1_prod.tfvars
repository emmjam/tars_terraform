##########
# GENERAL
##############################################################################
project = "tars"

environment = "prod"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "prod"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "prod"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "prod"
    "propagate_at_launch" = "true"
  }
]

###############################################################################
# CTRL
###############################################################################

##########
# Guardduty
##############################################################################

guardduty_master_enabled = "0"
guardduty_member_enabled = "0"

###############################################################################
# prod
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.128.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.128.0/26",
  "10.167.128.64/26",
  "10.167.128.128/26",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.128.192/28",
  "10.167.128.208/28",
  "10.167.128.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.128.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.129.0/27",
  "10.167.129.32/27",
  "10.167.129.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.129.96/28",
  "10.167.129.112/28",
  "10.167.129.128/28",
]

#  "10.167.129.144/28",
#  "10.167.129.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.129.176/28",
  "10.167.129.192/28",
  "10.167.129.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.129.224/28",
  "10.167.129.240/28",
  "10.167.130.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.130.16/28",
  "10.167.130.32/28",
  "10.167.130.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.130.64/28",
  "10.167.130.80/28",
  "10.167.130.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.130.112/28",
  "10.167.130.128/28",
  "10.167.130.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.130.160/28",
  "10.167.130.176/28",
  "10.167.130.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.130.208/28",
  "10.167.130.224/28",
  "10.167.130.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.131.0/28",
  "10.167.131.16/28",
  "10.167.131.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.131.48/28",
  "10.167.131.64/28",
  "10.167.131.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.131.96/28",
  "10.167.131.112/28",
  "10.167.131.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.131.144/28",
  "10.167.131.160/28",
  "10.167.131.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.131.192/28",
  "10.167.131.208/28",
  "10.167.131.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.131.240/28",
  "10.167.132.0/28",
  "10.167.132.16/28",
]

ibs_subnets_cidrs = [
  "10.167.132.32/28",
  "10.167.132.48/28",
  "10.167.132.64/28",
]

ibs_db_subnets_cidrs = [
  "10.167.132.80/28",
  "10.167.132.96/28",
  "10.167.132.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.132.128/28",
  "10.167.132.144/28",
  "10.167.132.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.132.176/28",
  "10.167.132.192/28",
  "10.167.132.208/28",
]

xenco_subnets_cidrs = [
  "10.167.132.224/28",
  "10.167.132.240/28",
  "10.167.133.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.133.16/28",
  "10.167.133.32/28",
  "10.167.133.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.133.64/28",
  "10.167.133.80/28",
  "10.167.133.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.133.112/28",
  "10.167.133.128/28",
  "10.167.133.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.133.160/28",
  "10.167.133.176/28",
  "10.167.133.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.133.208/28",
  "10.167.133.224/28",
#  "10.167.133.240/28",
]

#  "10.167.134.0/28",
#  "10.167.134.16/28",

test_database_subnets_cidrs = [
  "10.167.134.32/27",
  "10.167.134.64/27",
  "10.167.134.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.134.128/28",
  "10.167.134.144/28",
  "10.167.134.160/28",
]

third_party_subnets_cidrs = [
  "10.167.134.176/28",
  "10.167.134.192/28",
  "10.167.134.208/28",
]

owasp_subnets_cidrs = [
  "10.167.134.224/28",
  "10.167.134.240/28",
  "10.167.135.0/28",
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
tars_rds_username = "tarsuatadmin"

tars_rds_password = "sPPmE94NsvmfTmqj5K5YvFxZLmnm9T"

# TARSDB
tars_rds_allocated_storage = "300"
tars_rds_snapshot = "tarsuat-050418"

# MISSDB
mis_rds_username = "misprodadmin"
mis_rds_password = "vQy7UCW3owPxLMDuUPjzmmKmEYei4k"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = ""

# MISSDB
rsis_rds_username = "rsisprodadmin"
rsis_rds_password = "vQy7UCW3owPxLMDuUPjzmmKmEYei4k"
rsis_rds_allocated_storage = "300"
rsis_rds_snapshot = ""

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "YwBWc8HvweT3Lun8"

# CPCTSDB
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "cpcdev01-180621"

# IBSDB
ibs_rds_username = "ibsprodadmin"

ibs_rds_password = "sPPmE94NsvmfTmqj5K5YvFxZLmnm9T"

ibs_rds_snapshot = "prod-ibsdb-with-users-and-geo-data"

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

#############################################################################
# CWLES
#############################################################################

cwles_curator_max_age = "30"

cwles_data_instance_type    = "m4.large.elasticsearch"
cwles_data_instance_count   = "2"
cwles_data_volume_size      = "512"
cwles_master_instance_type  = "t2.small.elasticsearch"
cwles_master_instance_count = "2"

# Target DMS RDS instances
target_dms_tars_rds_storage_type = "gp2"
target_dms_tars_rds_engine = "oracle-se2"
target_dms_tars_rds_engine_version = "12.1.0.2.v11"
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

target_dms_on_prem_tars_rds_snapshot = "tars-prod-tars-dms-tarsopdmstg-2018-07-30"

target_dms_cpc_rds_storage_type = "gp2"
target_dms_cpc_rds_engine = "oracle-se2"
target_dms_cpc_rds_engine_version = "12.1.0.2.v11"
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

target_dms_on_prem_cpc_rds_snapshot = "tars-prod-tars-dms-cpcopdmstg-2018-07-30"

target_dms_rsis_rds_storage_type = "gp2"
target_dms_rsis_rds_engine = "oracle-se2"
target_dms_rsis_rds_engine_version = "12.1.0.2.v11"
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

target_dms_on_prem_rsis_rds_snapshot = "tars-prod-tars-dms-rsisopdmstg-2018-07-30"

target_dms_mis_rds_storage_type = "gp2"
target_dms_mis_rds_engine = "oracle-se2"
target_dms_mis_rds_engine_version = "12.1.0.2.v11"
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

target_dms_on_prem_mis_rds_snapshot = "tars-prod-tars-dms-misopdmstg-2018-07-30"

# Source DMS RDS instances
source_dms_tars_rds_storage_type = "gp2"
source_dms_tars_rds_engine = "oracle-se2"
source_dms_tars_rds_engine_version = "12.1.0.2.v11"
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
source_dms_cpc_rds_engine_version = "12.1.0.2.v11"
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
source_dms_rsis_rds_engine_version = "12.1.0.2.v11"
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
source_dms_mis_rds_engine_version = "12.1.0.2.v11"
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
