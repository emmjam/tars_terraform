## Tfvars

account_environment = "prod"

aws_account_id = "246976497890"

private_domain_name = "tars.dvsa.aws"

###############################################################################
# ACCOUNT
###############################################################################

all_users = [
  "rob.hart@dvsa.gov.uk",
  "mark.thompson@bjss.com",
  "steve.wilson@bjss.com",
  "brian.collinson@bjss.com",
  "allan.todd@bjss.com",
  "michael.taylor@bjss.com",
  "sam.smart@bjss.com",
  "graham.king@bjss.com",
  "jamie.kelly@bjss.com",
  "matthew.bell@dvsa.gov.uk",
  "alice.haws@dvsa.gov.uk",
  "paul.duffy@dvsa.gov.uk",
  "callum.massey@bjss.com",
  "ian.harris@bjss.com",
  "chris.nappin@bjss.com",
]

administrators = [
  "ian.harris@bjss.com",
  "mark.thompson@bjss.com",
  "callum.massey@bjss.com",
  "steve.wilson@bjss.com",
  "brian.collinson@bjss.com",
  "michael.taylor@bjss.com",
  "sam.smart@bjss.com",
  "graham.king@bjss.com",
  "allan.todd@bjss.com",
  "jamie.kelly@bjss.com",
  "chris.nappin@bjss.com",
]

power_users = [
]

dms_users = [
  "david.giles@bjss.com",
]

capita_users = [
]

ithc_ro_users = [
]

dvsa_ro_users = [
  "matthew.bell@dvsa.gov.uk",
  "alice.haws@dvsa.gov.uk",
  "paul.duffy@dvsa.gov.uk"
]

###############################################################################
# MGMT
###############################################################################

mgmt_vpc_id                 = "vpc-e303d285"           # TODO: use remote state
mgmt_vpc_cidr_block         = "10.200.0.0/16"          # TODO: use remote state
mgmt_tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state
mgmt_jenkins_elb_subnet     = "10.200.3.32/28"         # TODO: use remote state
mgmt_gitlab_subnet          = "10.200.2.128/28"        # TODO: use remote state
mgmt_aws_account_id = "645711882182"
mgmt_aws_region     = "eu-west-1"
mgmt_project        = "tars"
mgmt_environment    = "mgmt"
mgmt_component      = "mgmt"


###############################################################################
# CONTROL PROD
###############################################################################
ctrl_vpc_cidr = "10.167.56.0/22"

ctrl_aws_account_id         = "246976497890"
ctrl_aws_region             = "eu-west-1"
ctrl_project                = "tars"
ctrl_environment            = "prod"
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

## jenkinsnode
jenkinsnode_instance_type        = "m5.large"
jenkinsnode_ami_build_id         = "80"
jenkinsnode_executors            = 5
jenkinsnode_asg_min_size         = 0
jenkinsnode_asg_max_size         = 3
jenkinsnode_scaledown_desired    = 1
jenkinsnode_scaledown_recurrence = "00 19 * * 1-5"
jenkinsnode_scaleup_desired      = 1
jenkinsnode_scaleup_recurrence   = "15 07 * * 1-5"

jenkinsctrl_instance_type        = "m5.large"
jenkinsctrl_ami_build_id         = "141"
jenkinsctrl_executors            = 5
jenkinsctrl_asg_min_size         = 0
jenkinsctrl_asg_max_size         = 3
jenkinsctrl_scaledown_desired    = 1
jenkinsctrl_scaledown_recurrence = "00 19 * * 1-5"
jenkinsctrl_scaleup_desired      = 1
jenkinsctrl_scaleup_recurrence   = "15 07 * * 1-5"

jenkinsctrl_subnets_cidrs = [
  "10.167.56.16/28",
  "10.167.56.32/28",
  "10.167.56.48/28",
]

wildfly-back_instance_type  = "m4.large"
wildfly-back_puppet_nodetype    = "tars-back"
wildfly-back_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 2
wildfly-back_scaledown_desired    = 0
wildfly-back_scaledown_recurrence = "00 18 * * 1-5"
wildfly-back_scaleup_desired      = 2
wildfly-back_scaleup_recurrence   = "00 08 * * 1-5"

## wildfly-batch
wildfly-batch_instance_type  = "m4.large"
wildfly-batch_puppet_nodetype    = "tars-batch"
wildfly-batch_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 18 * * 1-5"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 08 * * 1-5"

## wildfly-front
wildfly-front_instance_type  = "m4.large"
wildfly-front_puppet_env     = "opsdev"
wildfly-front_puppet_nodetype    = "tars-front"
wildfly-front_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 2
wildfly-front_scaledown_desired    = 0
wildfly-front_scaledown_recurrence = "00 18 * * 1-5"
wildfly-front_scaleup_desired      = 2
wildfly-front_scaleup_recurrence   = "00 08 * * 1-5"

## obs
obs_instance_type  = "m4.large"
obs_puppet_nodetype    = "obs"
obs_asg_min_size         = 0
obs_asg_max_size         = 2
obs_scaledown_desired    = 0
obs_scaledown_recurrence = "00 18 * * 1-5"
obs_scaleup_desired      = 2
obs_scaleup_recurrence   = "00 08 * * 1-5"

## ibs
ibs_instance_type  = "m4.large"
ibs_puppet_nodetype    = "ibs"
ibs_asg_min_size         = 0
ibs_asg_max_size         = 2
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 18 * * 1-5"
ibs_scaleup_desired      = 2
ibs_scaleup_recurrence   = "00 08 * * 1-5"
#ibsdb
ibs_rds_instance_class = "db.t2.small" //Aurora doesn't support t2.micro
ibs_rds_backup_retention_period = "7"
ibs_rds_backup_window = "02:38-03:08"
ibs_rds_maint_window = "sun:03:16-sun:03:46"

## fyndi-f
fyndi-f_instance_type  = "m4.large"
fyndi-f_puppet_nodetype    = "fyndi-front"
fyndi-f_asg_min_size         = 0
fyndi-f_asg_max_size         = 3
fyndi-f_scaledown_desired    = 0
fyndi-f_scaledown_recurrence = "00 18 * * 1-5"
fyndi-f_scaleup_desired      = 1
fyndi-f_scaleup_recurrence   = "00 08 * * 1-5"

## fyndi_back
fyndi-b_instance_type  = "m4.large"
fyndi-b_puppet_nodetype    = "fyndi-back"
fyndi-b_asg_min_size         = 0
fyndi-b_asg_max_size         = 3
fyndi-b_scaledown_desired    = 0
fyndi-b_scaledown_recurrence = "00 18 * * 1-5"
fyndi-b_scaleup_desired      = 1
fyndi-b_scaleup_recurrence   = "00 08 * * 1-5"

## wildfly-messaging
wildfly-messaging_instance_type  = "m4.large"
wildfly-messaging_puppet_nodetype    = "tars-messaging"
wildfly-messaging_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 1
wildfly-messaging_scaledown_desired    = 0
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_desired      = 1
wildfly-messaging_scaleup_recurrence   = "00 07 * * 1-5"

## AWS MQ
aws_mq_engine_type             = "ActiveMQ"
aws_mq_engine_version          = "5.15.0"
aws_mq_host_instance_type      = "mq.t2.micro"
aws_mq_deployment_mode         = "ACTIVE_STANDBY_MULTI_AZ"

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
cpc-back_instance_type  = "m4.large"
cpc-back_puppet_nodetype    = "cpc-back"
cpc-back_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 2
cpc-back_scaledown_desired    = 0
cpc-back_scaledown_recurrence = "00 22 * * 1-5"
cpc-back_scaleup_desired      = 1
cpc-back_scaleup_recurrence   = "00 07 * * 1-5"

## cpc-front
cpc-front_instance_type  = "m4.large"
cpc-front_puppet_nodetype    = "cpc-front"
cpc-front_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 2
cpc-front_scaledown_desired    = 0
cpc-front_scaledown_recurrence = "00 22 * * 1-5"
cpc-front_scaleup_desired      = 1
cpc-front_scaleup_recurrence   = "00 07 * * 1-5"

## cpc-batch
cpc-batch_instance_type  = "m4.large"
cpc-batch_puppet_nodetype    = "cpc-batch"
cpc-batch_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"
cpc-batch_asg_min_size         = 0
cpc-batch_asg_max_size         = 1
cpc-batch_scaledown_desired    = 0
cpc-batch_scaledown_recurrence = "00 22 * * 1-5"
cpc-batch_scaleup_desired      = 1
cpc-batch_scaleup_recurrence   = "00 07 * * 1-5"

# CPCDB
cpc_rds_storage_type = "gp2"
cpc_rds_engine = "oracle-se2"
cpc_rds_engine_version = "12.1.0.2.v11"
cpc_rds_instance_class = "db.r4.xlarge"
cpc_rds_port = "1521"
cpc_rds_public = "false"
cpc_rds_multi_az = "true" # it takes an age to build if true
cpc_rds_backup_retention = "7"
cpc_rds_backup_window = "02:38-03:08"
cpc_rds_maint_window = "sun:03:16-sun:03:46"
cpc_rds_skip_final_snapshot = false
cpc_rds_apply_immediately = "true"
cpc_rds_license_model = "license-included"
cpc_rds_autoscale = "False"

aws_mq_config_description    = "TARS MQ Configuration"
aws_mq_config_name           = "tars-awsmq"
aws_mq_config_engine_type    = "ActiveMQ"
aws_mq_config_engine_version = "5.15.0"

## bastion
bastion_instance_type        = "t2.micro"
bastion_ami_build_id         = "194"
bastion_asg_min_size         = 1
bastion_asg_max_size         = 3
bastion_scaledown_desired    = 1
bastion_scaledown_recurrence = "00 19 * * 1-5"
bastion_scaleup_desired      = 1
bastion_scaleup_recurrence   = "00 07 * * 1-5"

## Grafana
grafana_instance_type        = "t2.micro"
grafana_ami_build_id         = "207"
grafana_asg_min_size         = 1
grafana_asg_max_size         = 1
grafana_scaledown_desired    = 1
grafana_scaledown_recurrence = "00 19 * * 1-5"
grafana_scaleup_desired      = 1
grafana_scaleup_recurrence   = "00 07 * * 1-5"

##  JMeter
jmeter_instance_type              = "t2.micro"
jmeter_asg_size_desired_on_create = 0
jmeter_asg_size_max               = 3
jmeter_asg_size_min               = 0
jmeter_puppet_kms_key = "38af52b4-66c9-473c-b61a-c9589605ffd8"

## Prometheus
#Due to there being no wildcard cert in prod this is used.
prometheus_cert_name = "prometheus-prod"

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

whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "77.86.30.4/32",      # BJSS VPN (Decom ~06/18)
  "148.253.134.213/32", # BJSS VPN 04/18
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "92.54.181.128/29",   # Informed Solutions
  "87.81.132.117/32",   # Informed Solutions
  "54.72.37.158/32",    # Selenium Elasticgrid Proxy
]

dvsa_dc_whitelist = [
  "10.100.120.10/32",
  "10.201.86.17/32",
  "10.84.192.114/32",
  "10.84.192.116/32",
  "10.166.0.14/32",
  "10.166.0.28/32",
  "10.166.0.43/32",
  "172.21.6.179/32",
  "10.100.126.9/32",
  "10.150.36.82/32",
  "10.14.0.140/32",
  "10.69.3.11/32",
  "172.21.34.139/32",
  "10.84.202.121/32",
  "10.84.202.120/32",
  "10.12.0.133/32",
  "172.21.53.77/32",
  "10.86.192.111/32",
  "10.69.0.4/31",
  "10.69.128.4/32",
  "10.84.192.0/23",
  "10.69.3.4/32",
  "10.201.83.86/32",
  "10.166.0.0/26"
]

# This will need changing when we know what the DVA IP is
dva_whitelist = [
  "77.86.30.4/32",      # BJSS VPN (Decom ~06/18)
  "148.253.134.213/32", # BJSS VPN 04/18
  "194.32.31.1/32",     # DVA IP
]

dvsa_mgmt_inbound = [
  "10.84.192.0/23",
  "10.69.3.4/32"
]

# WSUS is covered above in the DC whitelist
dvsa_sccm_services = "10.84.192.157/32"
dvsa_epo_services = "10.84.192.158/32"

# 3rd party
avarto_sftp_server = "51.231.12.13/32"
sweda_samba_server = "10.69.3.11/32"
dvla_adli_server = "51.231.10.92/32"
dvla_elise_server = "51.231.10.81/32"
rsis_samba_server = "10.14.0.140/32"

# Capita TARS UAT DB subnets for DMS
capita_db_subnets = "10.86.192.0/23"

capita_db_from_port = "6720"
capita_db_to_port = "6721"

# squidnat
squidnat_instance_type = "m5.large"

ops_team_email = "mark.thompson@bjss.com"

public_domain_name = "prod.tars.dvsacloud.uk"

aws_account_alias = "tarsprod"

# ACM Certname
cert_name = "tars-prod-public"

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

## Elasticache

elc_main_engine          = "memcached"
elc_main_engine_version  = "1.4.34"
elc_main_node_type       = "cache.t2.medium"
elc_main_cache_nodes     = "3"
elc_main_parameter_group = "default.memcached1.4"
elc_main_port            = "11211"

logs_list = []

# TARSDB
tars_rds_storage_type = "gp2"
tars_rds_engine = "oracle-se2"
tars_rds_engine_version = "12.1.0.2.v11"
tars_rds_instance_class = "db.r4.xlarge"
tars_rds_port = "1521"
tars_rds_public = "false"
tars_rds_multi_az = "true" # it takes an age to build if true
tars_rds_backup_retention = "7"
tars_rds_backup_window = "02:38-03:08"
tars_rds_maint_window = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately = "true"
tars_rds_license_model = "license-included"
tars_rds_autoscale = "True"

# MISDB
mis_rds_storage_type = "gp2"
mis_rds_engine = "oracle-se2"
mis_rds_engine_version = "12.1.0.2.v11"
mis_rds_instance_class = "db.r4.xlarge"
mis_rds_port = "1521"
mis_rds_public = "false"
mis_rds_multi_az = "true" # it takes an age to build if true
mis_rds_backup_retention = "7"
mis_rds_backup_window = "02:38-03:08"
mis_rds_maint_window = "sun:03:16-sun:03:46"
mis_rds_skip_final_snapshot = true
mis_rds_apply_immediately = "true"
mis_rds_license_model = "license-included"
mis_rds_autoscale = "True"

# RSISDB
rsis_rds_storage_type = "gp2"
rsis_rds_engine = "oracle-se2"
rsis_rds_engine_version = "12.1.0.2.v11"
rsis_rds_instance_class = "db.r4.xlarge"
rsis_rds_port = "1521"
rsis_rds_public = "false"
rsis_rds_multi_az = "true" # it takes an age to build if true
rsis_rds_backup_retention = "7"
rsis_rds_backup_window = "02:38-03:08"
rsis_rds_maint_window = "sun:03:16-sun:03:46"
rsis_rds_skip_final_snapshot = true
rsis_rds_apply_immediately = "true"
rsis_rds_license_model = "license-included"
sris_rds_autoscale = "True"

# DMS Replication instance

tars_dms_allocated_storage = "50"
tars_dms_apply_immediately = true
tars_dms_auto_minor_version_upgrade = true
tars_dms_engine_version = "2.4.2"
tars_dms_multi_az = false
tars_dms_maint_window = "sun:03:16-sun:03:46"
tars_dms_publicly_accessible = false
tars_dms_replication_instance_class = "dms.t2.micro"
