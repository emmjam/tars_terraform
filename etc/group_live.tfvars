## Tfvars

account_environment = "live"

aws_account_id = "246976497890"

public_domain_name = "prod.tars.dvsacloud.uk"

private_domain_name_aws = "tars.dvsa.aws"

private_domain_name = "live.tars.dvsacloud.uk"

root_domain_name = "tars.dvsacloud.uk"

aws_account_alias = "tarslive"

domain_name = "tars.dvsacloud.uk"

# ACM Certname
cert_name              = "tars-prod-public"
payments_cert_name     = "payments-prod-public"
reporting_xe_cert_name = "*"

default_tags = {
  Group = "live"
}

asg_default_tags = [
  {
    "key"                 = "Group"
    "value"               = "live"
    "propagate_at_launch" = "true"
  }
]

###############################################################################
# ACCOUNT
###############################################################################

cwl_retention_days = "731"

###############################################################################
# MGMT
###############################################################################

mgmt_vpc_id                 = "vpc-e303d285"           # TODO: use remote state
mgmt_vpc_cidr_block         = "10.200.0.0/16"          # TODO: use remote state
mgmt_tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state
mgmt_jenkins_elb_subnet     = "10.200.3.32/28"         # TODO: use remote state
mgmt_gitlab_subnet          = "10.200.5.128/28"        # TODO: use remote state
mgmt_aws_account_id         = "645711882182"
mgmt_aws_region             = "eu-west-1"
mgmt_project                = "tars"
mgmt_environment            = "mgmt"
mgmt_component              = "mgmt"


###############################################################################
# CONTROL PROD
###############################################################################
ctrl_vpc_cidr = "10.167.56.0/22"

ctrl_aws_account_id         = "246976497890"
ctrl_aws_region             = "eu-west-1"
ctrl_project                = "tars"
ctrl_environment            = "live"
ctrl_component              = "ctrl"
ctrl_vpc_id                 = "vpc-26e49240"           # TODO: use remote state
ctrl_vpc_cidr_block         = "10.167.56.0/22"         # TODO: use remote state
ctrl_tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state

ctrl_nat_subnets_cidrs = [
  "10.167.56.0/28",
]

###############################################################################
# CONTROL MGMT
###############################################################################

ctrl_mgmt_aws_account_id         = "645711882182"
ctrl_mgmt_aws_region             = "eu-west-1"
ctrl_mgmt_project                = "tars"
ctrl_mgmt_environment            = "mgmt"
ctrl_mgmt_component              = "ctrl"
ctrl_mgmt_vpc_id                 = "vpc-ff970799"           # TODO: use remote state
ctrl_mgmt_vpc_cidr_block         = "10.167.64.0/22"         # TODO: use remote state
ctrl_mgmt_tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state

###############################################################################
# BASE
###############################################################################

#Monitoring
prometheus_asg_min_size          = 1
prometheus_asg_max_size          = 1
prometheus_instance_type         = "t3.medium"
prometheus_ami_build_id          = "1274"
prometheus_efs_provisioned_mibps = 5


## jenkins
jenkinsctrl_subnets_cidrs = [
  "10.167.56.16/28",
  "10.167.56.32/28",
  "10.167.56.48/28",
]

wildfly-back_instance_type        = "m4.xlarge"
wildfly-back_puppet_nodetype      = "tars-back"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 4
wildfly-back_scaledown_desired    = 3
wildfly-back_scaledown_recurrence = "1 6,18 * * *"
wildfly-back_scaleup_desired      = 4
wildfly-back_scaleup_recurrence   = "1 12,00 * * *"

## wildfly-batch
wildfly-batch_instance_type        = "m4.large"
wildfly-batch_puppet_nodetype      = "tars-batch"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 1
wildfly-batch_scaledown_recurrence = "00 18 * * 1-5"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 08 * * 1-5"

## wildfly-front
wildfly-front_instance_type        = "m4.large"
wildfly-front_puppet_env           = "opsdev"
wildfly-front_puppet_nodetype      = "tars-front"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 2
wildfly-front_scaledown_desired    = 2
wildfly-front_scaledown_recurrence = "00 18 * * 1-5"
wildfly-front_scaleup_desired      = 2
wildfly-front_scaleup_recurrence   = "00 08 * * 1-5"

## obs
obs_instance_type        = "m4.large"
obs_puppet_nodetype      = "obs"
obs_asg_min_size         = 0
obs_asg_max_size         = 2
obs_scaledown_desired    = 2
obs_scaledown_recurrence = "00 18 * * 1-5"
obs_scaleup_desired      = 2
obs_scaleup_recurrence   = "00 08 * * 1-5"

## ibs
ibs_instance_type        = "m4.large"
ibs_puppet_nodetype      = "ibs"
ibs_asg_min_size         = 0
ibs_asg_max_size         = 6
ibs_scaledown_desired    = 6
ibs_scaledown_recurrence = "00 18 * * 1-5"
ibs_scaleup_desired      = 6
ibs_scaleup_recurrence   = "00 08 * * 1-5"

#ibsdb
ibs_rds_instance_class          = "db.r3.large" //Aurora doesn't support t2.micro
ibs_rds_backup_retention_period = "7"
ibs_rds_backup_window           = "02:38-03:08"
ibs_rds_maint_window            = "sun:03:16-sun:03:46"
ibs_rds_apply_immediately       = "true"

## fyndi-f
fyndi-f_instance_type        = "m4.large"
fyndi-f_puppet_nodetype      = "fyndi-front"
fyndi-f_asg_min_size         = 0
fyndi-f_asg_max_size         = 2
fyndi-f_scaledown_desired    = 2
fyndi-f_scaledown_recurrence = "00 18 * * 1-5"
fyndi-f_scaleup_desired      = 2
fyndi-f_scaleup_recurrence   = "00 08 * * 1-5"

## fyndi_back
fyndi-b_instance_type        = "m4.large"
fyndi-b_puppet_nodetype      = "fyndi-back"
fyndi-b_asg_min_size         = 0
fyndi-b_asg_max_size         = 2
fyndi-b_scaledown_desired    = 2
fyndi-b_scaledown_recurrence = "00 18 * * 1-5"
fyndi-b_scaleup_desired      = 2
fyndi-b_scaleup_recurrence   = "00 08 * * 1-5"

## wildfly-messaging
wildfly-messaging_instance_type        = "m5.large"
wildfly-messaging_puppet_nodetype      = "tars-messaging"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 2
wildfly-messaging_scaledown_desired    = 2
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_desired      = 2
wildfly-messaging_scaleup_recurrence   = "00 07 * * 1-5"
wildfly_messaging_id                   = "release_202109"

## AWS MQ
aws_mq_engine_type        = "ActiveMQ"
aws_mq_engine_version     = "5.15.9"
aws_mq_host_instance_type = "mq.m5.large"
aws_mq_deployment_mode    = "ACTIVE_STANDBY_MULTI_AZ"

aws_mq_users_admin_user              = "admin"
aws_mq_users_admin_password          = "admin123456789"
aws_mq_users_admin_group             = "admin"
aws_mq_users_tars_batch_user         = "tars_batch"
aws_mq_users_tars_batch_password     = "password123456"
aws_mq_users_tars_batch_group        = "tars_batch"
aws_mq_users_tars_messaging_user     = "tars_messaging"
aws_mq_users_tars_messaging_password = "password123456"
aws_mq_users_tars_messaging_group    = "tars_messaging"
aws_mq_users_cpc_back_user           = "cpc_back"
aws_mq_users_cpc_back_password       = "password123456"
aws_mq_users_cpc_back_group          = "cpc_back"
aws_mq_users_cpc_batch_user          = "cpc_batch"
aws_mq_users_cpc_batch_password      = "password123456"
aws_mq_users_cpc_batch_group         = "cpc_batch"

## cpc-back
cpc-back_instance_type        = "m4.large"
cpc-back_puppet_nodetype      = "cpc-back"
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 2
cpc-back_scaledown_desired    = 2
cpc-back_scaledown_recurrence = "00 22 * * 1-5"
cpc-back_scaleup_desired      = 2
cpc-back_scaleup_recurrence   = "00 07 * * 1-5"

## cpc-front
cpc-front_instance_type        = "m4.large"
cpc-front_puppet_nodetype      = "cpc-front"
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 2
cpc-front_scaledown_desired    = 2
cpc-front_scaledown_recurrence = "00 22 * * 1-5"
cpc-front_scaleup_desired      = 2
cpc-front_scaleup_recurrence   = "00 07 * * 1-5"

## sftpplus-svr
sftpplus-svr_instance_type        = "t2.medium"
sftpplus-svr_puppet_nodetype      = "sftpplus-svr"
sftpplus-svr_asg_min_size         = 0
sftpplus-svr_asg_max_size         = 1
sftpplus-svr_scaledown_desired    = 1
sftpplus-svr_scaledown_recurrence = "00 20 * * 1-5"
sftpplus-svr_scaleup_desired      = 1
sftpplus-svr_scaleup_recurrence   = "00 04 * * 1-5"

## cpc-batch
cpc-batch_instance_type        = "m4.large"
cpc-batch_puppet_nodetype      = "cpc-batch"
cpc-batch_asg_min_size         = 0
cpc-batch_asg_max_size         = 1
cpc-batch_scaledown_desired    = 1
cpc-batch_scaledown_recurrence = "00 22 * * 1-5"
cpc-batch_scaleup_desired      = 1
cpc-batch_scaleup_recurrence   = "00 07 * * 1-5"

aws_mq_config_description    = "TARS MQ Configuration"
aws_mq_config_name           = "tars-awsmq"
aws_mq_config_engine_type    = "ActiveMQ"
aws_mq_config_engine_version = "5.15.9"

##  JMeter
jmeter_instance_type              = "t3.micro"
jmeter_asg_size_desired_on_create = 0
jmeter_asg_size_max               = 0
jmeter_asg_size_min               = 0

## XE
oraclexe_svr_id               = "1259"
oraclexe_asg_min_size         = 0
oraclexe_asg_max_size         = 1
oraclexe_scaledown_desired    = 0
oraclexe_scaledown_recurrence = "00 19 * * 1-5"
oraclexe_scaleup_desired      = 1
oraclexe_scaleup_recurrence   = "00 04 * * 1-5"

## SFTP
sftp_ami_build_id = "1452"

bastion_elb_subnets_cidrs = [
  "10.167.56.64/28",
  "10.167.56.80/28",
  "10.167.56.96/28",
]

ctrl_bastion_subnets = [
  "10.167.56.112/28",
  "10.167.56.128/28",
  "10.167.56.144/28",
]

grafana_alb_subnets_cidrs = [
  "10.167.56.160/28",
  "10.167.56.176/28",
  "10.167.56.192/28",
]

ctrl_grafana_subnets = [
  "10.167.56.208/28",
  "10.167.56.224/28",
  "10.167.56.240/28",
]

vpc_endpoint_subnets_cidrs = [
  "10.167.57.0/28",
  "10.167.57.16/28",
  "10.167.57.32/28",
]

oraclexe_subnets_cidrs = [
  "10.167.58.0/28",
  "10.167.58.16/28",
  "10.167.58.32/28",
]

payments_whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "148.253.134.213/32", # BJSS VPN 04/18
  "54.72.37.158/32",    # Selenium Elasticgrid Proxy
  "54.76.206.25/32",    # Perf01 NATGW IP
  "185.8.52.254/32",    # Start Barclays IP
  "185.8.53.254/32",
  "185.8.54.254/32",
  "212.23.45.97/32",
  "91.208.214.0/24",
  "185.8.52.0/22",
  "185.139.244.0/22",
  "212.35.124.164/32", # End Barclays IP
  "154.14.88.249/32",  # DVSA Notts Corp & Wifi
]

whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "10.201.80.0/21",     # DVSA Notts Internal
  "10.69.3.64/26",      # DVSA ZPA VPN
  "10.69.131.64/26",    # DVSA ZPA VPN
  "148.253.134.213/32", # BJSS VPN 04/18
  "148.253.134.212/32", # BJSS Guest Wifi 10/18
  "54.72.37.158/32",    # Selenium Elasticgrid Proxy
  "199.83.128.0/21",    # Begin Incapsula IPs
  "198.143.32.0/19",
  "149.126.72.0/21",
  "103.28.248.0/22",
  "185.11.124.0/22",
  "192.230.64.0/18",
  "45.64.64.0/22",
  "107.154.0.0/16",
  "45.60.0.0/16",
  "45.223.0.0/16", # End Incapsula IPs
  "10.69.3.15/32", # Begin DVSA MS-RDS
  "10.69.3.16/32",
  "10.69.3.17/32",
  "10.69.3.18/32",
  "10.69.1.70/31",
  "10.84.192.159/32",
  "10.84.192.161/32", # End DVSA MS-RDS
  "85.115.53.201/32", #DSCALLARDS
  "80.194.75.82/32",  #DSCALLARDS
  "34.242.28.119/32", #MGMT Jenkins for url checks
  "154.14.88.249/32", # DVSA Notts Corp & Wifi
]

dvsa_dc_whitelist = [
  "10.84.192.114/32",
  "10.84.192.116/32",
  "10.166.0.14/32",
  "10.166.0.28/32",
  "10.166.0.43/32",
  "172.21.6.179/32",
  "10.14.0.142/32",
  "10.69.0.0/16",
  "172.21.34.139/32",
  "10.84.202.121/32",
  "10.84.202.120/32",
  "172.21.53.77/32",
  "10.86.192.111/32",
  "10.69.0.4/31",
  "10.69.128.4/32",
  "10.69.3.4/32",
  "10.166.0.0/26"
]

messaging_print = "true"
dvsa_printers = [
  "10.12.0.138/32",
  "10.69.3.33/32",
  "10.14.0.138/32",
]

# Used by any AWS based ec2's that need to use Azure DNS to resolve external stuff
dvsa_dns_servers = [
  "10.166.0.14/32",
  "10.166.0.28/32",
  "10.166.0.43/32"
]

# This will need changing when we know what the DVA IP is
dva_whitelist = [
  "148.253.134.213/32", # BJSS VPN 04/18
  "194.32.31.1/32",     # DVA IP
  "194.32.29.1/32",     # DVA IP
]

dvsa_mgmt_inbound = "10.69.3.4/32"

dvsa_icmp_monitoring = [
  "10.69.3.0/26",
  "10.69.131.0/26",
]

dvsa_win_monitoring = [
  "10.69.3.15/32",
  "10.69.3.16/32",
  "10.69.3.17/32",
  "10.69.3.18/32",
]

# Used for DTC printer queue lookups
dvsa_ldap_server = "10.166.0.14/32"

# IRDT printer range
dvsa_irdt_printers = "10.201.0.0/16"

# 3rd party
avarto_sftp_server        = "85.133.77.93/32"
avarto_aws_sftp_server    = "10.7.107.0/24"
sweda_samba_server        = "10.69.3.11/32"
dvla_adli_server          = "51.231.10.92/32"
dvla_elise_server         = "51.231.10.84/32"
rsis_samba_server_archive = "10.14.0.142/32"

# squidnat
squidnat_instance_type = "m5.large"
squidnat_ami_build_id  = "1426"

ops_team_email = "tars.platform-team@bjss.com"



# This is new. This is to start the long hike to having
# one consistent domain name structure across the project.
# This will be used by the ctrl component initially in order
# to have a private hosted zone local to the VPC that matches
# the appropriate structure. This variable can then be used
# to expand the single structure wider as different components
# become malleable. One day, all groups may share one single
# domain root and make use of it for all domain purposes,
# public *and* private


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

## Elasticache

elc_main_engine          = "memcached"
elc_main_engine_version  = "1.4.34"
elc_main_node_type       = "cache.t2.medium"
elc_main_cache_nodes     = "1"
elc_main_parameter_group = "default.memcached1.4"
elc_main_port            = "11211"

### Business Objects
bobj_asg_max_size  = 1
bobj_asg_min_size  = 0
bobj_instance_type = "m5.xlarge"

# TARSDB
tars_rds_storage_type                       = "gp2"
tars_rds_engine                             = "oracle-se2"
tars_rds_engine_version                     = "19.0.0.0.ru"
tars_rds_instance_class                     = "db.m4.2xlarge"
tars_rds_allow_major_engine_version_upgrade = false
tars_rds_parameter_group_name               = "tarsdb-19c"
tars_rds_option_group_name                  = "option-group-19c"
tars_rds_port                               = "1521"
tars_rds_public                             = "false"
tars_rds_multi_az                           = "true" # it takes an age to build if true
tars_rds_backup_retention                   = "30"
tars_rds_backup_window                      = "02:38-03:08"
tars_rds_maint_window                       = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot                = false
tars_rds_apply_immediately                  = "true"
tars_rds_license_model                      = "license-included"
tars_rds_autoscale                          = "True"
tars_rds_sid_name                           = "TARSDB"

# MISDB
mis_rds_storage_type            = "gp2"
mis_rds_engine                  = "oracle-se2"
mis_rds_engine_version          = "19.0.0.0.ru"
mis_rds_instance_class          = "db.r5.large"
mis_rds_port                    = "1521"
mis_rds_public                  = "false"
mis_rds_multi_az                = "true" # it takes an age to build if true
mis_rds_backup_retention        = "30"
mis_rds_backup_window           = "02:38-03:08"
mis_rds_maint_window            = "sun:05:01-sun:05:31"
mis_rds_skip_final_snapshot     = false
mis_rds_apply_immediately       = "true"
mis_rds_license_model           = "license-included"
mis_rds_autoscale               = "True"
mis_rds_sid_name                = "MISDB"
mis_allow_major_version_upgrade = false
mis_rds_parameter_group_name    = "misdb-19c"
mis_rds_option_group_name       = "option-group-19c"

# RSISDB
rsis_rds_storage_type            = "gp2"
rsis_rds_engine                  = "oracle-se2"
rsis_rds_instance_class          = "db.r5.large"
rsis_rds_port                    = "1521"
rsis_rds_public                  = "false"
rsis_rds_multi_az                = "true" # it takes an age to build if true
rsis_rds_backup_retention        = "30"
rsis_rds_backup_window           = "02:38-03:08"
rsis_rds_maint_window            = "sun:03:16-sun:03:46"
rsis_rds_skip_final_snapshot     = false
rsis_rds_apply_immediately       = "true"
rsis_rds_license_model           = "license-included"
rsis_rds_autoscale               = "True"
rsis_rds_sid_name                = "RSISDB"
rsis_rds_engine_version          = "19.0.0.0.ru"
rsis_rds_parameter_group_name    = "rsisdb-19c"
rsis_rds_option_group_name       = "option-group-19c"
rsis_allow_major_version_upgrade = true


# CPCDB
cpc_rds_storage_type            = "gp2"
cpc_rds_engine                  = "oracle-se2"
cpc_rds_engine_version          = "19.0.0.0.ru"
cpc_rds_instance_class          = "db.r4.xlarge"
cpc_rds_port                    = "1521"
cpc_rds_public                  = "false"
cpc_rds_multi_az                = "true" # it takes an age to build if true
cpc_rds_backup_retention        = "30"
cpc_rds_backup_window           = "02:38-03:08"
cpc_rds_maint_window            = "sun:03:16-sun:03:46"
cpc_rds_skip_final_snapshot     = false
cpc_rds_apply_immediately       = "true"
cpc_rds_license_model           = "license-included"
cpc_rds_autoscale               = "True"
cpc_rds_sid_name                = "CPCDB"
cpc_rds_parameter_group_name    = "cpcdb-19c"
cpc_rds_option_group_name       = "option-group-19c"
cpc_allow_major_version_upgrade = false

# DVSA Mail Domain
dvsa_external_mail_domain = "dvsa.gov.uk"

# DC Gateway details
dc_gateway_name    = "Tars-Prod-DirCon"
dc_gateway_aws_asn = "64514"

# DC Gateway Primary VIF
dc_primary_connection_id    = "dxcon-fgjp09jy"
dc_vif_primary_name         = "Tars-Prod-DirCon-Pri"
dc_vif_primary_vlan         = "381"
dc_vif_primary_router       = "10.111.0.13/30"
dc_vif_primary_aws_router   = "10.111.0.14/30"
dc_vif_primary_bgp_auth_key = "6fbuqVX7bKFvM43KpdGFLwThACH4nB"

# DC Gateway Secondary VIF
dc_secondary_connection_id    = "dxcon-ffgc0859"
dc_vif_secondary_vlan         = "307"
dc_vif_secondary_name         = "Tars-Prod-DirCon-Sec"
dc_vif_secondary_router       = "10.111.8.13/30"
dc_vif_secondary_aws_router   = "10.111.8.14/30"
dc_vif_secondary_bgp_auth_key = "jXjTQvJpEnuFvzpy2XvEBDpJe5khPc"

# DC Gateway VIF parameters
dc_vif_asn = "64515"

# TSS Opsgenie
opsgenie_endpoint = "https://api.opsgenie.com/v1/json/amazonsns?apiKey=4cb725d3-32c1-47ae-b3b7-e38187fb9202"

#Jmeter
jmeter_ami_build_id = "1266"

# Enable action for AmazonMQ Queue CloudWatch Alarm
velocity_email_cw_metric_alarm_enabled           = false
mq_cw_metric_velocity_email_alarm_action_enabled = false
email_queue_cw_metric_alarm_enabled              = false
mq_cw_metric_email_queue_alarm_action_enabled    = false
print_queue_cw_metric_alarm_enabled              = false
mq_cw_metric_print_queue_alarm_action_enabled    = false

# Enable action for Sftp CPU CloudWatch Alarm
sftp_cpuutilization_cw_metric_alarm_enabled        = false
sftp_cpuutilization_cw_metric_alarm_action_enabled = false

# Enable action for tars-core CPU CloudWatch Alarm
tars_core_cpuutilization_cw_metric_alarm_enabled        = false
tars_core_cpuutilization_cw_metric_alarm_action_enabled = false

power_bi_cidr = "10.164.216.0/22"

ftts_elig_port = "18079"

#Lambda Govnotify - Short Commit version now required taken from Job Console.
notify_lambda_version = "9a8d23be3"

# reporting-xe
reporting_xe_instance_type    = "t3.large"
reporting_xe_count            = 0
reporting_xe_ami_build_id     = "1447"
reporting_xe_ebs_size         = "40"
reporting_xe_asg_min_size     = 0
reporting_xe_asg_max_size     = 0
reporting_xe_asg_desired_size = 0
reporting_xe_subnet_cidr      = [""]

ssm_kms_key_id      = "e6d167b6-b8a0-4acb-b982-9846429c79a5"
ses_user_access_key = true

# Whether or not to create old RDS option and parameter groups
deprecated_rds_compatibility = true

# Whether to create obs Register New Business Holding resources
obs_reg_holding = false
obs_reg_holding_lambda_version = 1

# Whether to create Driver Services resources (false by default, enable in env file)
drv_svc_enabled     = false
driver_service_cert = "dsa.dft.gov.uk"

# mock gov gateway accounts processor
mock_gov_gw_accounts_processor_lambda_version = "2"

# lambda ebs housekeeping
unattached_ebs_vols_lambda_version = "1"