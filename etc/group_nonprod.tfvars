## Tfvars

account_environment = "nonprod"

aws_account_id = "652856684323"

private_domain_name = "tars.dvsa.aws"

###############################################################################
# ACCOUNT
###############################################################################
# aws_account_alias = "tarsnonprod"

# public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

users = [
  "rob.hart@dvsa.gov.uk",
]

administrators = [
  "mark.thompson@bjss.com",
  "callum.massey@bjss.com",
  "steve.wilson@bjss.com",
  "brian.collinson@bjss.com",
  "chris.nappin@bjss.com",
]

power_users = [
  "allan.todd@bjss.com",
]

dms_users = [
  "ana.rotstein@bjss.com",
  "david.giles@bjss.com",
]

capita_users = [
  "paul.hepple@capita.co.uk",
  "rob.whyte@capita.co.uk",
]

capita_perf_ro_users = [
  "Himanshu.Dhir@capita.co.uk",
  "Subrata.Dey@capita.co.uk"
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
# CONTROL NONPROD
###############################################################################
ctrl_vpc_cidr = "10.167.60.0/22"

ctrl_aws_account_id         = "652856684323"
ctrl_aws_region             = "eu-west-1"
ctrl_project                = "tars"
ctrl_environment            = "nonprod"
ctrl_component              = "ctrl"
ctrl_vpc_id                 = "vpc-9f2ba7f9"           # TODO: use remote state
ctrl_vpc_cidr_block         = "10.167.60.0/22"         # TODO: use remote state
ctrl_tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state

ctrl_nat_subnets_cidrs = [
  "10.167.60.0/28",
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
jenkinsnode_instance_type        = "m4.large"
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
  "10.167.60.16/28",
  "10.167.60.32/28",
  "10.167.60.48/28",
]

wildfly-back_instance_type  = "t2.medium"
wildfly-back_puppet_nodetype    = "tars-back"
wildfly-back_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 1
wildfly-back_scaledown_desired    = 0
wildfly-back_scaledown_recurrence = "00 22 * * 1-5"
wildfly-back_scaleup_desired      = 1

wildfly-back_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-batch
wildfly-batch_instance_type  = "t2.medium"
wildfly-batch_puppet_nodetype    = "tars-batch"
wildfly-batch_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 22 * * 1-5"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 04 * * 1-5"

## obs
obs_instance_type  = "t2.medium"
obs_puppet_nodetype    = "obs"
obs_asg_min_size         = 0
obs_asg_max_size         = 3
obs_scaledown_desired    = 0
obs_scaledown_recurrence = "00 22 * * 1-5"
obs_scaleup_desired      = 1
obs_scaleup_recurrence   = "00 04 * * 1-5"

## ibs
ibs_instance_type  = "t2.medium"
ibs_puppet_nodetype    = "ibs"
ibs_asg_min_size         = 0
ibs_asg_max_size         = 3
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 22 * * 1-5"
ibs_scaleup_desired      = 1
ibs_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-front
wildfly-front_instance_type  = "t2.medium"
wildfly-front_puppet_nodetype    = "tars-front"
wildfly-front_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 1
wildfly-front_scaledown_desired    = 0
wildfly-front_scaledown_recurrence = "00 22 * * 1-5"
wildfly-front_scaleup_desired      = 1
wildfly-front_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-messaging
wildfly-messaging_instance_type  = "t2.medium"
wildfly-messaging_puppet_nodetype    = "tars-messaging"
wildfly-messaging_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 1
wildfly-messaging_scaledown_desired    = 1
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_desired      = 1
wildfly-messaging_scaleup_recurrence   = "00 07 * * 1-5"

## wildfly-mock
wildfly-mock_instance_type  = "t2.medium"
wildfly-mock_puppet_nodetype    = "mock"
wildfly-mock_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
wildfly-mock_asg_min_size         = 0
wildfly-mock_asg_max_size         = 1
wildfly-mock_scaledown_desired    = 0
wildfly-mock_scaledown_recurrence = "00 22 * * 1-5"
wildfly-mock_scaleup_desired      = 1
wildfly-mock_scaleup_recurrence   = "00 07 * * 1-5"

## cpc-back
cpc-back_instance_type  = "t2.medium"
cpc-back_puppet_nodetype    = "cpc-back"
cpc-back_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 1
cpc-back_scaledown_desired    = 0
cpc-back_scaledown_recurrence = "00 22 * * 1-5"
cpc-back_scaleup_desired      = 1
cpc-back_scaleup_recurrence   = "00 07 * * 1-5"


## cpc-back
cpc-front_instance_type  = "t2.medium"
cpc-front_puppet_nodetype    = "cpc-front"
cpc-front_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 1
cpc-front_scaledown_desired    = 0
cpc-front_scaledown_recurrence = "00 22 * * 1-5"
cpc-front_scaleup_desired      = 1
cpc-front_scaleup_recurrence   = "00 07 * * 1-5"

## AWS MQ
aws_mq_engine_type             = "ActiveMQ"
aws_mq_engine_version          = "5.15.0"
aws_mq_host_instance_type      = "mq.t2.micro"
aws_mq_deployment_mode         = "SINGLE_INSTANCE"

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

aws_mq_config_description    = "TARS MQ Configuration"
aws_mq_config_name           = "tars-awsmq"
aws_mq_config_engine_type    = "ActiveMQ"
aws_mq_config_engine_version = "5.15.0"

## bastion
bastion_instance_type        = "t2.micro"
bastion_ami_build_id         = "107"
bastion_asg_min_size         = 0
bastion_asg_max_size         = 3
bastion_scaledown_desired    = 1
bastion_scaledown_recurrence = "00 19 * * 1-5"
bastion_scaleup_desired      = 1
bastion_scaleup_recurrence   = "00 07 * * 1-5"

##  JMeter
jmeter_instance_type              = "t2.micro"
jmeter_asg_size_desired_on_create = 0
jmeter_asg_size_max               = 3
jmeter_asg_size_min               = 0
jmeter_puppet_kms_key = "791140e3-1c70-4d21-943f-007c92c1e17d"

bastion_elb_subnets_cidrs = [
  "10.167.60.64/28",
  "10.167.60.80/28",
  "10.167.60.96/28",
]

ctrl_bastion_subnets = [
  "10.167.60.112/28",
  "10.167.60.128/28",
  "10.167.60.144/28",
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

dvsa_mgmt_inbound = [
  "10.84.192.0/23",
  "10.69.3.4/32"
]

# WSUS is covered above in the DC whitelist
dvsa_sccm_services = "10.84.192.157/32"
dvsa_epo_services = "10.84.192.158/32"

# Capita TARS UAT DB subnets for DMS
capita_db_subnets = "10.86.192.0/23"

capita_db_from_port = "6720"
capita_db_to_port = "6721"

# Capita TARS Prod DB subnets for DMS
#capita_prod_db = "10.84.192.0/23"

# squidnat
squidnat_instance_type = "t2.micro"

ops_team_email = "mark.thompson@bjss.com"

public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

aws_account_alias = "tarsnonprod"

## Elasticache

elc_main_engine          = "memcached"
elc_main_engine_version  = "1.4.34"
elc_main_node_type       = "cache.t2.micro"
elc_main_cache_nodes     = "1"
elc_main_parameter_group = "default.memcached1.4"
elc_main_port            = "11211"

# ACM Certname
cert_name = "*"

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

# TARSDB
tars_rds_storage_type = "gp2"
tars_rds_engine = "oracle-se2"
tars_rds_engine_version = "12.1.0.2.v11"
tars_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
tars_rds_port = "1521"
tars_rds_public = "false"
tars_rds_multi_az = "false" # it takes an age to build if true
tars_rds_backup_retention = "7"
tars_rds_backup_window = "02:38-03:08"
tars_rds_maint_window = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately = "true"
tars_rds_license_model = "license-included"
tars_rds_autoscale = "True"

# DMS Replication instance

tars_dms_allocated_storage = "50"
tars_dms_apply_immediately = true
tars_dms_auto_minor_version_upgrade = true
tars_dms_engine_version = "2.4.2"
tars_dms_multi_az = false
tars_dms_maint_window = "sun:03:16-sun:03:46"
tars_dms_publicly_accessible = false
tars_dms_replication_instance_class = "dms.t2.micro"

# IBSDB
ibs_rds_instance_class = "db.t2.small" //Aurora doesn't support t2.micro
ibs_rds_backup_retention_period = "7"
ibs_rds_backup_window = "02:38-03:08"
ibs_rds_maint_window = "sun:03:16-sun:03:46"

## Do Not change list order only append
logs_list = [
  "/opt/wildfly/standalone/log/server.log",
  "/opt/wildfly/tars-log/current_diagnosis.log",
  "/var/log/cloud-init-output.log",
  "/var/log/squid/access.log",
  "/var/log/squid/cache.log",
  "/opt/wildfly/tars-log/dsa-examiner.log",
  "/opt/wildfly/tars-log/qas.log",
]

# CPCDB
cpc_rds_storage_type = "gp2"
cpc_rds_engine = "oracle-se2"
cpc_rds_engine_version = "12.1.0.2.v11"
cpc_rds_instance_class = "db.t2.micro" # was "db.m4.4xlarge"
cpc_rds_port = "1521"
cpc_rds_public = "false"
cpc_rds_multi_az = "false" # it takes an age to build if true
cpc_rds_backup_retention = "7"
cpc_rds_backup_window = "02:38-03:08"
cpc_rds_maint_window = "sun:03:16-sun:03:46"
cpc_rds_skip_final_snapshot = true
cpc_rds_apply_immediately = "true"
cpc_rds_license_model = "license-included"
cpc_rds_autoscale = "True"
