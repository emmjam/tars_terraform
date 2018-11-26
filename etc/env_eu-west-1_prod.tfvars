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
    "value"               = "live"
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
prometheus_efs_provisioned_mibps  = 5

#EFS Backups
#smarts: to be enabled after testing in another env
efs_backup_asg_min_size           = 0
efs_backup_asg_max_size           = 0
efs_backup_instance_type          = "t3.nano"
efs_backup_ami_build_id           = 309

###############################################################################
# CTRL
###############################################################################

##########
# Guardduty
##############################################################################

guardduty_master_enabled = "0"
guardduty_member_enabled = "1"

###############################################################################
# prod
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.128.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.128.0/27",
  "10.167.128.32/27",
  "10.167.128.64/27",
]

tars_alb_internal = [
  "10.167.128.96/28",
  "10.167.128.112/28",
  "10.167.128.128/28",
]

obs_alb_internal = [
  "10.167.128.144/28",
  "10.167.128.160/28",
  "10.167.128.176/28",
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

tars_dvsa_alb_cidrs = [
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
]

apache_subnet_cidrs = [
  "10.167.133.240/28",
  "10.167.134.0/28",
  "10.167.134.16/28",
]

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

cpc_alb_internal = [
  "10.167.134.176/28",
  "10.167.134.192/28",
  "10.167.134.208/28",
]

bobj_subnets_cidrs = [
  "10.167.134.224/28",
  "10.167.134.240/28",
  "10.167.135.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.135.16/28",
  "10.167.135.32/28",
  "10.167.135.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.135.64/28",
  "10.167.135.80/28",
  "10.167.135.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.135.112/28",
  "10.167.135.128/28",
  "10.167.135.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.135.160/28",
  "10.167.135.176/28",
  "10.167.135.192/28",
]

efs_backup_subnets_cidrs = [
  "10.167.135.208/28",
  "10.167.135.224/28",
  "10.167.135.240/28",
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
tars_rds_username = "tarsadmin"
tars_rds_password = "tjbzVTT83kacEEcY"
tars_rds_allocated_storage = "500"
tars_rds_snapshot = ""

# MISDB
mis_rds_username = "misadmin"
mis_rds_password = "rXTdAxhj3kN8S2Gc"
mis_rds_allocated_storage = "300"
mis_rds_autoscale = "False"
mis_rds_snapshot = ""

# RSISDB
rsis_rds_username = "rsisadmin"
rsis_rds_password = "Wbx8Mdu9YjdjwTRM"
rsis_rds_allocated_storage = "80"
rsis_rds_autoscale = "False"
rsis_rds_snapshot = ""

# CPCSDB
cpc_rds_username = "cpcadmin"
cpc_rds_password = "fgvRRVEJPAf2L3wC"
cpc_rds_allocated_storage = "100"
cpc_rds_snapshot = ""

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


# DMS Stuff
xe_role_name = "OracleXE"

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

# Incapsula
fyndi_incapsula = "anskt9w.x.incapdns.net"
ibs_incapsula   = "5cdgrpe.x.incapdns.net"
obs_incapsula   = "zv9vwoz.x.incapdns.net"
irdt_incapsula  = "zi5ckxk.x.incapdns.net"

private_cert_domain_name = "prod.tars.dvsa.aws"

cpc_internet_cert       = "tars-prod-cpc-internet"
cpc_dvsa_internet_cert  = "tars-prod-cpc-dvsa-internet"
cpc_cert                = "cpc-prod"
cpc_private_cert        = "cpc-dvsa"
fyndi_cert              = "fyndi-prod-public"
tars_cert               = "tars-prod-public"
tars_private_cert       = "tars-core-private"
tars_pdf_cert           = "tars-prod-pdf"
obs_cert                = "obs-prod-public"
ibs_cert                = "ibs-prod-public"
irdt_cert               = "irdt-prod-public"
apache_cert             = "routing-prod-public"


## wildfly-batch temporary 'off' schedule
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 18 * * 1-5"
wildfly-batch_scaleup_desired      = 0
wildfly-batch_scaleup_recurrence   = "00 08 * * 1-5"

## cpc-batch temporary 'off' schedule
cpc-batch_asg_min_size         = 0
cpc-batch_asg_max_size         = 1
cpc-batch_scaledown_desired    = 0
cpc-batch_scaledown_recurrence = "00 22 * * 1-5"
cpc-batch_scaleup_desired      = 0
cpc-batch_scaleup_recurrence   = "00 07 * * 1-5"

apache_ami_build_id = 413

# Added by TS-4753
# To be removed by TS-4722 and TS-4756
# TEMP UAT DB's in Prod
uat_dbs_in_prod = "true"
tmp_tars_rds_username = "tarsuatadmin"
tmp_tars_rds_password = "YTN5f3RN8kV8u9mX"
tmp_tars_rds_allocated_storage = "500"
tmp_tars_rds_snapshot = "tars-prod1-tars-core-tarsdb-241018"
tmp_mis_rds_username = "misuatadmin"
tmp_mis_rds_password = "BaLhNU73XCpFCNXP"
tmp_mis_rds_allocated_storage = "500"
tmp_mis_rds_snapshot = "tars-prod1-tars-reporting-misdb-241018"
tmp_rsis_rds_username = "tarsrsisadmin"
tmp_rsis_rds_password = "pbj9VQTE4T5GDVbF"
tmp_rsis_rds_allocated_storage = "300"
tmp_rsis_rds_snapshot = "tars-prod1-tars-reporting-rsisdb-241018"
tmp_cpc_rds_username = "tarscpcadmin"
tmp_cpc_rds_password = "gKFTFnhM5d2NqCFn"
tmp_cpc_rds_allocated_storage = "100"
tmp_cpc_rds_snapshot = "tars-prod1-cpc-cpcdb-241018"
