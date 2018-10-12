##########
# GENERAL
##############################################################################
project = "tars"

environment = "uat01"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "uat01"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "uat01"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "nonprod"
    "propagate_at_launch" = "true"
  }
]

#This is to address a tech debt issue.
puppet_environment = "uat01"

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
# uat01
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.8.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.8.0/26",
  "10.167.8.64/26",
  "10.167.8.128/26",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.8.192/28",
  "10.167.8.208/28",
  "10.167.8.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.8.240/28",
]

xenco_subnets_cidrs = [
  "10.167.9.0/28",
  "10.167.9.16/28",
  "10.167.9.32/28",
]

elc_main_subnets_cidrs = [
  "10.167.9.48/28",
  "10.167.9.64/28",
  "10.167.9.80/28",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.9.96/28",
  "10.167.9.112/28",
  "10.167.9.128/28",
]

#  "10.167.9.144/28",
#  "10.167.9.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.9.176/28",
  "10.167.9.192/28",
  "10.167.9.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.9.224/28",
  "10.167.9.240/28",
  "10.167.10.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.10.16/28",
  "10.167.10.32/28",
  "10.167.10.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.10.64/28",
  "10.167.10.80/28",
  "10.167.10.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.10.112/28",
  "10.167.10.128/28",
  "10.167.10.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.10.160/28",
  "10.167.10.176/28",
  "10.167.10.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.10.208/28",
  "10.167.10.224/28",
  "10.167.10.240/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.11.0/28",
  "10.167.11.16/28",
  "10.167.11.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.11.48/28",
  "10.167.11.64/28",
  "10.167.11.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.11.96/28",
  "10.167.11.112/28",
  "10.167.11.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.11.144/28",
  "10.167.11.160/28",
  "10.167.11.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.11.192/28",
  "10.167.11.208/28",
  "10.167.11.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.11.240/28",
  "10.167.12.0/28",
  "10.167.12.16/28",
]

ibs_subnets_cidrs = [
  "10.167.12.32/28",
  "10.167.12.48/28",
  "10.167.12.64/28",
]

ibs_db_subnets_cidrs = [
  "10.167.12.80/28",
  "10.167.12.96/28",
  "10.167.12.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.12.128/28",
  "10.167.12.144/28",
  "10.167.12.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.12.176/28",
  "10.167.12.192/28",
  "10.167.12.208/28",
]

# "10.167.12.224/28",
# "10.167.12.240/28",

tars_backend_subnets_cidrs = [
  "10.167.13.0/27",
  "10.167.13.32/27",
  "10.167.13.64/27",
]

# "10.167.13.96/28",

cpc_efs_subnets_cidrs = [
  "10.167.13.112/28",
  "10.167.13.128/28",
  "10.167.13.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.13.160/28",
  "10.167.13.176/28",
  "10.167.13.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.13.208/28",
#  "10.167.13.224/28",

]

efs_backup_subnets_cidrs = [
  "10.167.13.240/28",
  "10.167.14.0/28",
  "10.167.14.16/28",
]

test_database_subnets_cidrs = [
  "10.167.14.32/27",
  "10.167.14.64/27",
  "10.167.14.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.14.128/28",
  "10.167.14.144/28",
  "10.167.14.160/28",
]

third_party_subnets_cidrs = [
  "10.167.14.176/28",
  "10.167.14.192/28",
  "10.167.14.208/28",
]

# "10.167.14.224/28",
# "10.167.14.240/28",

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.15.0/28",
  "10.167.15.16/28",
  "10.167.15.32/28",
]

batch_efs_subnets_cidrs = [
  "10.167.15.48/28",
  "10.167.15.64/28",
  "10.167.15.80/28",
]

prometheus_subnets_cidrs  = [
  "10.167.15.96/28",
  "10.167.15.112/28",
  "10.167.15.128/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.15.144/28",
  "10.167.15.160/28",
  "10.167.15.176/28",
]

prometheus_alb_private_cidrs = [
  "10.167.15.192/28",
  "10.167.15.208/28",
  "10.167.15.224/28",
]

# "10.167.15.240/28",

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
tars_rds_snapshot = "tars-uat01-tars-core-tarsdb-20180720"
tars_rds_autoscale = "False"


# CPCSDB
cpc_rds_username = "cpcuatadmin"

cpc_rds_password = "Mg28yDQjuEWndbtz"

# CPCTSDB
cpc_rds_allocated_storage = "100" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "cpcuat01-inc-seq-views-cpc01-2018-08-01"

# IBSDB
ibs_rds_username = "tarsuatadmin"

ibs_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

ibs_rds_snapshot = "uat01-ibs-subnet-move"

# MISDB
mis_rds_username = "misuatadmin"
mis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = "tars-uat01-tars-reporting-misdb-20180816"
mis_rds_autoscale = "False"

# RSISDB
rsis_rds_username = "rsisuatadmin"
rsis_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"
rsis_rds_allocated_storage = "300"
rsis_rds_snapshot = "tars-uat01-tars-reporting-rsisdb-20180816"
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
cpc_cert    = "*"
fyndi_cert  = "*"
tars_cert   = "*"
obs_cert    = "*"
ibs_cert    = "*"
