##########
# GENERAL
##############################################################################
project = "tars"

environment = "uat02"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "uat02"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
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
# BASE
###############################################################################

#Monitoring
prometheus_asg_min_size           = 1
prometheus_asg_max_size           = 1
prometheus_instance_type          = "t2.medium"
prometheus_ami_build_id           = 377
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
# uat02
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.48.0/21"

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

jenkins_nat_subnets_cidrs = [
  "10.167.48.240/28",
]

xenco_subnets_cidrs = [
  "10.167.49.0/28",
  "10.167.49.16/28",
  "10.167.49.32/28",
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

#  "10.167.49.144/28",
#  "10.167.49.160/28",

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

xenco_lb_subnets_cidrs = [
  "10.167.52.176/28",
  "10.167.52.192/28",
  "10.167.52.208/28",
]

# "10.167.52.224/28",
# "10.167.52.240/28",

tars_backend_subnets_cidrs = [
  "10.167.53.0/27",
  "10.167.53.32/27",
  "10.167.53.64/27",
]

# "10.167.53.96/28",

cpc_efs_subnets_cidrs = [
  "10.167.53.112/28",
  "10.167.53.128/28",
  "10.167.53.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.53.160/28",
  "10.167.53.176/28",
  "10.167.53.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.53.208/28",
#  "10.167.53.224/28",
]

efs_backup_subnets_cidrs = [
  "10.167.53.240/28",
  "10.167.54.0/28",
  "10.167.54.16/28",
]

test_database_subnets_cidrs = [
  "10.167.54.32/27",
  "10.167.54.64/27",
  "10.167.54.96/27",
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

prometheus_subnets_cidrs  = [
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

ad_peering_enabled = true
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

# TARSDB
tars_rds_username = "tarsuatadmin"

tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

# TARSDB
tars_rds_allocated_storage = "300"
tars_rds_snapshot = "tars-uat02-tars-core-tarsdb-20181108"
tars_rds_autoscale = "False"


# CPCSDB
cpc_rds_username = "cpcuatadmin"

cpc_rds_password = "Mg28yDQjuEWndbtz"

# CPCTSDB
cpc_rds_allocated_storage = "100" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-uat01-cpc-cpcdb-20181108"

# IBSDB
ibs_rds_username = "tarsuatadmin"

ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

ibs_rds_snapshot = "uat01-ibs-subnet-move"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = "tars-uat01-tars-reporting-misdb-20181108"
mis_rds_autoscale = "False"

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
rsis_rds_allocated_storage = "300"
rsis_rds_snapshot = "tars-uat01-tars-reporting-rsisdb-20181108"
rsis_rds_autoscale = "False"

#############################################################################
# Transit VPC peering
#############################################################################

transit_peering_enabled = true

#############################################################################
# UAT should always be up - TS-3293
#############################################################################

wildfly-back_scaledown_desired = 1
wildfly-batch_scaledown_desired = 1
obs_scaledown_desired = 1
ibs_scaledown_desired = 1
fyndi-f_scaledown_desired = 1
fyndi-b_scaledown_desired = 1
wildfly-front_scaledown_desired = 1
wildfly-messaging_scaledown_desired = 1
wildfly-mock_scaledown_desired = 1
cpc-back_scaledown_desired = 1
cpc-front_scaledown_desired = 1
sftpplus-svr_scaledown_desired = 1

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "uat01.tars.dvsa.aws"

apache_ami_build_id = 406

# Temporary allocation -
# To be removed when overall range is increased
apache_subnet_cidrs = [
 "10.167.52.224/28",
 "10.167.52.240/28",
 "10.167.53.96/28",
]
