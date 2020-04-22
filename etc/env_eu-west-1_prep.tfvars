##########
# GENERAL
##############################################################################
project = "tars"

environment = "prep"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "prep"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "prep"
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
guardduty_member_enabled = "0"

###############################################################################
# prep
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.136.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.136.0/27",
  "10.167.136.32/27",
  "10.167.136.64/27",
]

tars_alb_internal = [
  "10.167.136.96/28",
  "10.167.136.112/28",
  "10.167.136.128/28",
]

obs_alb_internal = [
  "10.167.136.144/28",
  "10.167.136.160/28",
  "10.167.136.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.136.192/28",
  "10.167.136.208/28",
  "10.167.136.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.136.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.137.0/27",
  "10.167.137.32/27",
  "10.167.137.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.137.96/28",
  "10.167.137.112/28",
  "10.167.137.128/28",
]

#  "10.167.137.144/28",
#  "10.167.137.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.137.176/28",
  "10.167.137.192/28",
  "10.167.137.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.137.224/28",
  "10.167.137.240/28",
  "10.167.138.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.138.16/28",
  "10.167.138.32/28",
  "10.167.138.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.138.64/28",
  "10.167.138.80/28",
  "10.167.138.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.138.112/28",
  "10.167.138.128/28",
  "10.167.138.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.138.160/28",
  "10.167.138.176/28",
  "10.167.138.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.138.208/28",
  "10.167.138.224/28",
  "10.167.138.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.139.0/28",
  "10.167.139.16/28",
  "10.167.139.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.139.48/28",
  "10.167.139.64/28",
  "10.167.139.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.139.96/28",
  "10.167.139.112/28",
  "10.167.139.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.139.144/28",
  "10.167.139.160/28",
  "10.167.139.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.139.192/28",
  "10.167.139.208/28",
  "10.167.139.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.139.240/28",
  "10.167.140.0/28",
  "10.167.140.16/28",
]

ibs_subnets_cidrs = [
  "10.167.140.32/28",
  "10.167.140.48/28",
  "10.167.140.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.140.80/28",
  "10.167.140.96/28",
  "10.167.140.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.140.128/28",
  "10.167.140.144/28",
  "10.167.140.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.140.176/28",
  "10.167.140.192/28",
  "10.167.140.208/28",
]

xenco_subnets_cidrs = [
  "10.167.140.224/28",
  "10.167.140.240/28",
  "10.167.141.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.141.16/28",
  "10.167.141.32/28",
  "10.167.141.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.141.64/28",
  "10.167.141.80/28",
  "10.167.141.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.141.112/28",
  "10.167.141.128/28",
  "10.167.141.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.141.160/28",
  "10.167.141.176/28",
  "10.167.141.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.141.208/28",
  "10.167.141.224/28",
]

apache_subnet_cidrs = [
  "10.167.141.240/28",
  "10.167.142.0/28",
  "10.167.142.16/28",
]

sftpplus_nlb_subnets_cidrs = [
  "10.167.142.32/28",
  "10.167.142.48/28",
  "10.167.142.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.142.80/28",
  "10.167.142.96/28",
  "10.167.142.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.142.128/28",
  "10.167.142.144/28",
  "10.167.142.160/28",
]

cpc_alb_internal = [
  "10.167.142.176/28",
  "10.167.142.192/28",
  "10.167.142.208/28",
]

bobj_subnets_cidrs = [
  "10.167.142.224/28",
  "10.167.142.240/28",
  "10.167.143.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.143.16/28",
  "10.167.143.32/28",
  "10.167.143.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.143.64/28",
  "10.167.143.80/28",
  "10.167.143.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.143.112/28",
  "10.167.143.128/28",
  "10.167.143.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.143.160/28",
  "10.167.143.176/28",
  "10.167.143.192/28",
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
tars_rds_password = "YTN5f3RN8kV8u9mX"
tars_rds_allocated_storage = "500"
tars_rds_snapshot = "tars-prod-tars-core-tarsdb-20190228"
tars_rds_skip_final_snapshot = true

# MISDB
mis_rds_username = "misuatadmin"
mis_rds_password = "BaLhNU73XCpFCNXP"
mis_rds_allocated_storage = "500"
mis_rds_snapshot = "tars-prod1-tars-reporting-misdb-241018"
mis_rds_skip_final_snapshot = true

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_password = "pbj9VQTE4T5GDVbF"
rsis_rds_allocated_storage = "300"
rsis_rds_snapshot = "tars-prod1-tars-reporting-rsisdb-241018"
rsis_rds_skip_final_snapshot = true

# CPCSDB
cpc_rds_username = "cpcadmin"
cpc_rds_password = "gKFTFnhM5d2NqCFn"
cpc_rds_allocated_storage = "100"
cpc_rds_snapshot = "rds:tars-prod-cpc-cpcdb-2018-12-17-02-49"
cpc_rds_skip_final_snapshot = true

# IBSDB
ibs_rds_username = "ibsprepadmin"
ibs_rds_password = "wZMJ2KWX8ZEEwJqbRmS7FEbWryBFhmWU"
ibs_rds_snapshot = "prep-ibsdb-19-06-18-comp-collapse"

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

# DHCP Scope options for DNS

domain_name_servers = [
  "AmazonProvidedDNS",
  "10.166.0.14",
  "10.166.0.28",
  "10.166.0.43",
]

private_cert_domain_name = "prep.tars.dvsa.aws"

cpc_internet_cert       = "tars-prep-cpc-internet"
cpc_dvsa_internet_cert  = "tars-prep-cpc-dvsa-internet"
cpc_cert                = "cpc-prep"
cpc_private_cert        = "cpc-dvsa"
fyndi_cert              = "fyndi-prep-public"
tars_cert               = "tars-prep-public"
payments_cert_name      = "payments-prep-public"
tars_private_cert       = "tars-core-private"
tars_pdf_cert           = "tars-prep-pdf"
obs_cert                = "obs-prep-public"
ibs_cert                = "ibs-prep-public"
irdt_cert               = "irdt-prep-public"
apache_cert             = "routing-prep-public"
bobj-server             = "*"
holding_pages_cert      = "maintenance-prod"

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

# Temporarily pointed at the app LBs as
# incapsula won't issue a site without the
# DNS records already existing. Catch 22.
dsa_incap_cname              = "routing-prep-public.prod.tars.dvsacloud.uk"
findnearest_incap_cname      = "fyndi-prep-public.prod.tars.dvsacloud.uk"
riverpractical_incap_cname   = "ibs-prep-public.prod.tars.dvsacloud.uk"

bobj_cert               = "bobj-prep"

#RDS Deletion Protection
tars_rds_delete_protect = false
cpc_rds_delete_protect = false
ibsdb_cluster_delete_protect = false
misdb_rds_delete_protect = false
risdb_rds_delete_protect = false

mes_db_cidr_block = [
  "10.201.20.0/28",
  "10.201.20.16/28",
  "10.201.20.32/28",
]
mes_api_cidr_block = [
  "10.201.10.144/28",
  "10.201.10.160/28",
  "10.201.10.176/28",
  "10.201.10.192/28",
  "10.201.10.208/28",
  "10.201.10.224/28",
]

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = "true"

sftpplus_alarm_count = "0"
sftpplus_topic_count = "0"

# RDS CloudWatch Monitoring
rds_cw_metric_alarm_enabled = false

# Enable action for RDS CloudWatch Alarm
rds_cw_metric_alarm_action_enabled = false
