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
  "10.167.8.0/27",
  "10.167.8.32/27",
  "10.167.8.64/27",
]

tars_alb_internal = [
  "10.167.8.96/28",
  "10.167.8.112/28",
  "10.167.8.128/28",
]

obs_alb_internal = [
  "10.167.8.144/28",
  "10.167.8.160/28",
  "10.167.8.176/28",
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

tars_dvsa_alb_cidrs = [
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

sftpplus_nlb_subnets_cidrs = [
  "10.167.14.32/28",
  "10.167.14.48/28",
  "10.167.14.64/28",
]

# Free subnets
# 10.167.14.80/28
# 10.167.14.96/28
# 10.167.14.112/28

jmeter_subnets_cidrs = [
  "10.167.14.128/28",
  "10.167.14.144/28",
  "10.167.14.160/28",
]

cpc_alb_internal = [
  "10.167.14.176/28",
  "10.167.14.192/28",
  "10.167.14.208/28",
]

bobj_subnets_cidrs = [
  "10.167.14.224/28",
  "10.167.14.240/28",
  "10.167.15.240/28",
]

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
tars_rds_snapshot = "tars-uat01-tars-core-tarsdb-2019-05-03-5-5-0-2"
tars_rds_autoscale = "False"


# CPCSDB
cpc_rds_username = "cpcuatadmin"

cpc_rds_password = "Mg28yDQjuEWndbtz"

# CPCTSDB
cpc_rds_allocated_storage = "100" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-uat01-cpc-cpcdb-2019-05-03-5-5-0-2"

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

wildfly-back_scaledown_desired = 0
wildfly-batch_scaledown_desired = 0
obs_scaledown_desired = 0
ibs_scaledown_desired = 0
fyndi-f_scaledown_desired = 0
fyndi-b_scaledown_desired = 0
wildfly-front_scaledown_desired = 0
wildfly-mock_scaledown_desired = 0
cpc-back_scaledown_desired = 0
cpc-front_scaledown_desired = 0
sftpplus-svr_scaledown_desired = 0

## wildfly-messaging
wildfly-messaging_instance_type        = "t3.medium"
wildfly-messaging_puppet_nodetype      = "tars-messaging"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 2
wildfly-messaging_scaledown_desired    = 2
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_desired      = 2
wildfly-messaging_scaleup_recurrence   = "00 07 * * 1-5"

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "uat01.tars.dvsa.aws"

apache_ami_build_id = 504

# Temporary allocation -
# To be removed when overall range is increased
apache_subnet_cidrs = [
 "10.167.12.224/28",
 "10.167.12.240/28",
 "10.167.13.96/28",
]
