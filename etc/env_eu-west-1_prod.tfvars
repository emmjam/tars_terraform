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

sftpplus_nlb_subnets_cidrs = [
  "10.167.134.32/28",
  "10.167.134.48/28",
  "10.167.134.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.134.80/28",
  "10.167.134.96/28",
  "10.167.134.112/28",
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

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"

mgmt_env = "mgmt"


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# Variables needed for spot instances
##

# Spot pricing value map
# Keep empty so that spot pricing is not used for PROD!
spot_pricing = {
  "c4.large"   = ""
  "c4.xlarge"  = ""
  "c4.2xlarge" = ""
  "c5.large"   = ""
  "c5.xlarge"  = ""
  "c5.2xlarge" = ""
  "m3.medium"  = ""
  "m3.large"   = ""
  "m4.large"   = ""
  "m4.2xlarge" = ""
  "m4.4xlarge" = ""
  "m5.large"   = ""
  "m5.xlarge"  = ""
  "m5d.large"  = ""
  "r4.xlarge"  = ""
  "r4.2xlarge" = ""
  "t2.micro"   = ""
  "t2.small"   = ""
  "t2.medium"  = ""
  "t2.large"   = ""
  "t3.nano"    = ""
  "t3.micro"   = ""
  "t3.small"   = ""
  "t3.medium"  = ""
}

rhel_spot_pricing = {
  "c4.large"   = ""
  "c4.xlarge"  = ""
  "c4.2xlarge" = ""
  "c5.large"   = ""
  "c5.xlarge"  = ""
  "c5.2xlarge" = ""
  "m3.medium"  = ""
  "m3.large"   = ""
  "m4.large"   = ""
  "m4.2xlarge" = ""
  "m4.4xlarge" = ""
  "m5.large"   = ""
  "m5.xlarge"  = ""
  "m5d.large"  = ""
  "r4.xlarge"  = ""
  "r4.2xlarge" = ""
  "t2.micro"   = ""
  "t2.small"   = ""
  "t2.medium"  = ""
  "t2.large"   = ""
  "t3.nano"    = ""
  "t3.micro"   = ""
  "t3.small"   = ""
  "t3.medium"  = ""
}

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
mis_rds_allocated_storage = "330"
mis_rds_autoscale = "False"
mis_rds_snapshot = ""

# RSISDB
rsis_rds_username = "rsisadmin"
rsis_rds_password = "Wbx8Mdu9YjdjwTRM"
rsis_rds_allocated_storage = "120"
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

ibs_rds_snapshot = "tars-prod-ibsdb-pre-release-5-10-0-3"

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

ad_peering_enabled = true
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

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
cpc_cert                = "cpc"
cpc_private_cert        = "cpc-dvsa"
fyndi_cert              = "fyndi-prod-public"
tars_cert               = "tars-prod-public"
tars_private_cert       = "tars-core-private"
tars_pdf_cert           = "tars-prod-pdf"
obs_cert                = "obs-prod-public"
ibs_cert                = "ibs-prod-public"
irdt_cert               = "irdt-prod-public"
apache_cert             = "routing-prod-public"
bobj_cert               = "bobj-prod"
holding_pages_cert      = "maintenance-prod"


## wildfly-batch temporary 'off' schedule
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 1
wildfly-batch_scaledown_recurrence = "00 18 * * 1-5"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 08 * * 1-5"

## cpc-batch temporary 'off' schedule
cpc-batch_asg_min_size         = 0
cpc-batch_asg_max_size         = 1
cpc-batch_scaledown_desired    = 1
cpc-batch_scaledown_recurrence = "00 22 * * 1-5"
cpc-batch_scaleup_desired      = 1
cpc-batch_scaleup_recurrence   = "00 07 * * 1-5"

apache_ami_build_id = 504

# Extra domains that the CloudFront distribution for
# maintenance pages should be aware of.
holding_pages_domains = [
  "dsa.dft.gov.uk",
  "finddrivinginstructor.direct.gov.uk",
  "driverpracticaltest.direct.gov.uk",
]

#RDS Deletion Protection
tars_rds_delete_protect = true
cpc_rds_delete_protect = true
ibsdb_cluster_delete_protect = true
misdb_rds_delete_protect = true
risdb_rds_delete_protect = true

mes_db_cidr_block = [
  "10.101.20.0/28",
  "10.101.20.16/28",
  "10.101.20.32/28",
]
mes_api_cidr_block = [
  "10.101.10.144/28",
  "10.101.10.160/28",
  "10.101.10.176/28",
  "10.101.10.192/28",
  "10.101.10.208/28",
  "10.101.10.224/28",
]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = "true"

tars_rds_backup_retention = "14"
mis_rds_backup_retention = "14"
cpc_rds_backup_retention = "14"
rsis_rds_backup_retention = "14"

sftpplus_alarm_actions_enabled = true
sftpplus_alarm_actions = ["arn:aws:sns:eu-west-1:246976497890:tars-prod-base-alerts"]
sftpplus_threshold = "1"