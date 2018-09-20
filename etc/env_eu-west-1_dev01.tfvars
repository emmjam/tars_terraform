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

#This is to address a tech debt issue.
puppet_environment = "dev01"

###############################################################################
# BASE
###############################################################################

#Monitoring
prometheus_asg_min_size           = 1
prometheus_asg_max_size           = 1
prometheus_instance_type          = "t2.medium"
prometheus_ami_build_id           = 250
prometheus_efs_provisioned_mibps  = 1

###############################################################################
# CTRL
###############################################################################

###############################################################################
# dev01
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.24.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.24.0/26",
  "10.167.24.64/26",
  "10.167.24.128/26",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.24.192/28",
  "10.167.24.208/28",
  "10.167.24.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.24.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.25.0/27",
  "10.167.25.32/27",
  "10.167.25.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.25.96/28",
  "10.167.25.112/28",
  "10.167.25.128/28",
]

#  "10.167.25.144/28",
#  "10.167.25.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.25.176/28",
  "10.167.25.192/28",
  "10.167.25.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.25.224/28",
  "10.167.25.240/28",
  "10.167.26.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.26.16/28",
  "10.167.26.32/28",
  "10.167.26.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.26.64/28",
  "10.167.26.80/28",
  "10.167.26.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.26.112/28",
  "10.167.26.128/28",
  "10.167.26.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.26.160/28",
  "10.167.26.176/28",
  "10.167.26.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.26.208/28",
  "10.167.26.224/28",
  "10.167.26.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.27.0/28",
  "10.167.27.16/28",
  "10.167.27.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.27.48/28",
  "10.167.27.64/28",
  "10.167.27.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.27.96/28",
  "10.167.27.112/28",
  "10.167.27.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.27.144/28",
  "10.167.27.160/28",
  "10.167.27.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.27.192/28",
  "10.167.27.208/28",
  "10.167.27.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.27.240/28",
  "10.167.28.0/28",
  "10.167.28.16/28",
]

ibs_subnets_cidrs = [
  "10.167.28.32/28",
  "10.167.28.48/28",
  "10.167.28.64/28",
]

ibs_db_subnets_cidrs = [
  "10.167.28.80/28",
  "10.167.28.96/28",
  "10.167.28.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.28.128/28",
  "10.167.28.144/28",
  "10.167.28.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.28.176/28",
  "10.167.28.192/28",
  "10.167.28.208/28",
]

xenco_subnets_cidrs = [
  "10.167.28.224/28",
  "10.167.28.240/28",
  "10.167.29.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.29.16/28",
  "10.167.29.32/28",
  "10.167.29.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.29.64/28",
  "10.167.29.80/28",
  "10.167.29.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.29.112/28",
  "10.167.29.128/28",
  "10.167.29.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.29.160/28",
  "10.167.29.176/28",
  "10.167.29.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.29.208/28",
#  "10.167.29.224/28",
#  "10.167.29.240/28",
]

#  "10.167.30.0/28",
#  "10.167.30.16/28",

test_database_subnets_cidrs = [
  "10.167.30.32/27",
  "10.167.30.64/27",
  "10.167.30.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.30.128/28",
  "10.167.30.144/28",
  "10.167.30.160/28",
]

third_party_subnets_cidrs = [
  "10.167.30.176/28",
  "10.167.30.192/28",
  "10.167.30.208/28",
]

owasp_subnets_cidrs = [
  "10.167.30.224/28",
  "10.167.30.240/28",
  "10.167.31.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.31.16/28",
  "10.167.31.32/28",
  "10.167.31.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.31.64/28",
  "10.167.31.80/28",
  "10.167.31.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.31.128/28",
  "10.167.31.144/28",
  "10.167.31.160/28",
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
tars_rds_snapshot = "tars-dev01-tars-core-tarsdb-20180720"

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "YwBWc8HvweT3Lun8"

# CPCTSDB
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-dev01-cpc-cpcdb-20180720"


# IBSDB
ibs_rds_username = "ibsdevadmin"

ibs_rds_password = "password"

ibs_rds_snapshot = "dev01-ibs-subnet-move"

# MISDB
mis_rds_username = "misdevadmin"
mis_rds_password = "password"
mis_rds_allocated_storage = "20"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

# RSISDB
rsis_rds_username = "rsisdevadmin"
rsis_rds_password = "password"
rsis_rds_allocated_storage = "20"
rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"

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
target_dms_cpc_rds_snapshot = "tars-dev01-tars-dms-cpcdmstg-20180720"

target_dms_on_prem_cpc_rds_snapshot = "cpc-dms-target-180619"

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
target_dms_rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmstg-20180720"

target_dms_on_prem_rsis_rds_snapshot = "rsis-dms-target-180628"

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
target_dms_mis_rds_snapshot = "tars-dev01-tars-dms-misdmstg-20180720"

target_dms_on_prem_mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

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

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]
