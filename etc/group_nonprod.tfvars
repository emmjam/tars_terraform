## Tfvars

account_environment = "nonprod"

aws_account_id = "652856684323"

private_domain_name = "tars.dvsa.aws"

###############################################################################
# ACCOUNT
###############################################################################
# aws_account_alias = "tarsnonprod"

# public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

all_users = [
  "steve.wilson@bjss.com",
  "chris.nappin@bjss.com",
  "david.giles@bjss.com",
  "philip.scally@bjss.com",
  "richard.freitas@bjss.com",
  "matthew.bell@dvsa.gov.uk",
  "alice.haws@dvsa.gov.uk",
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "michael.riley@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "stephen.davies@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "steven.ryalls@bjss.com",
  "winston.coleman@bjss.com",
  "billy.dhillon@bjss.com",
  "michael.hill@bjss.com",
  "catherine.campbell@bjss.com",
  "andrew.malcolm@bjss.com",
  "steven.millington@bjss.com",
  "michael.tribbick@bjss.com",
  "adrian.jones@bjss.com",
  "rajkieren.manku@bjss.com",
  "neil.eaton@bjss.com",
  "david.johnson@bjss.com",
  "daniel.thompson@bjss.com",
  "gareth.whiteside@bjss.com",
  "ibrar.akram@bjss.com",
  "john.bower@bjss.com",
  "luke.browning@bjss.com",
  "martin.cavanagh@bjss.com",
  "balkar.bains@bjss.com",
  "rishi.davda@bjss.com",
  "tom.bibb@bjss.com",
  "ian.harris@bjss.com",
  "josh.paveley@bjss.com",
  "aiman.chaudhary@bjss.com",
  "michelle.pike@bjss.com",
  "irfan.sidat@bjss.com",
  "john.reynolds@bjss.com",
  "david.woodley@bjss.com",
  "callum.massey@bjss.com",
]

administrators = [
]

ops_users = [
  "steve.wilson@bjss.com",
  "chris.nappin@bjss.com",
  "chris.nappin@bjss.com",
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "michael.riley@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "stephen.davies@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "adrian.jones@bjss.com",
  "rajkieren.manku@bjss.com",
  "daniel.thompson@bjss.com",
  "gareth.whiteside@bjss.com",
  "michael.tribbick@bjss.com",
  "ibrar.akram@bjss.com",
  "john.bower@bjss.com",
  "luke.browning@bjss.com",
  "tom.bibb@bjss.com",
  "ian.harris@bjss.com",
  "rishi.davda@bjss.com",
  "balkar.bains@bjss.com",
  "michelle.pike@bjss.com",
  "irfan.sidat@bjss.com",
  "john.reynolds@bjss.com",
  "callum.massey@bjss.com",
]

power_users = [
]

dms_users = [
  "david.giles@bjss.com",
]

db_cw_ro_users = [
  "david.giles@bjss.com",
]

support_ro_users = [
  "philip.scally@bjss.com",
  "richard.freitas@bjss.com",
  "catherine.campbell@bjss.com",
  "steven.ryalls@bjss.com",
  "winston.coleman@bjss.com",
  "billy.dhillon@bjss.com",
  "michael.hill@bjss.com",
  "andrew.malcolm@bjss.com",
  "steven.millington@bjss.com",
  "martin.cavanagh@bjss.com",
  "balkar.bains@bjss.com",
  "rishi.davda@bjss.com",
  "josh.paveley@bjss.com",
  "aiman.chaudhary@bjss.com",
  "michelle.pike@bjss.com",
  "john.reynolds@bjss.com",
  "david.woodley@bjss.com",
  "callum.massey@bjss.com",
]

dvsa_ro_users = [
  "matthew.bell@dvsa.gov.uk",
  "alice.haws@dvsa.gov.uk",
]

tss_billing_ro_users = [
  "neil.eaton@bjss.com",
  "david.johnson@bjss.com",
  "gareth.whiteside@bjss.com",
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

###############################################################################
# BASE
###############################################################################

# Disable AWS scaling for non prod, now in Env Control Jenkins jobs
aws_autoscaling_enabled = "0"

#Monitoring
prometheus_asg_min_size           = 0
prometheus_asg_max_size           = 1
prometheus_instance_type          = "m3.medium"
prometheus_ami_build_id           = 589
prometheus_efs_provisioned_mibps  = 1

## jenkinsnode
jenkinsnode_instance_type        = "m5d.large"
jenkinsnode_ami_build_id         = "639"
jenkinsnode_executors            = 20
jenkinsnode_asg_min_size         = 0
jenkinsnode_asg_max_size         = 1
jenkinsnode_scaledown_desired    = 1
jenkinsnode_scaledown_recurrence = "00 19 * * 1-5"
jenkinsnode_scaleup_desired      = 1
jenkinsnode_scaleup_recurrence   = "15 04 * * 1-5"

jenkinsctrl_subnets_cidrs = [
  "10.167.60.16/28",
  "10.167.60.32/28",
  "10.167.60.48/28",
]

wildfly-back_instance_type        = "t2.medium"
wildfly-back_puppet_nodetype      = "tars-back"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 1
wildfly-back_scaledown_desired    = 0
wildfly-back_scaledown_recurrence = "00 22 * * 1-5"
wildfly-back_scaleup_desired      = 1

wildfly-back_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-batch
wildfly-batch_instance_type        = "t2.medium"
wildfly-batch_puppet_nodetype      = "tars-batch"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 22 * * 1-5"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 04 * * 1-5"

## obs
obs_instance_type        = "m3.medium"
obs_puppet_nodetype      = "obs"
obs_asg_min_size         = 0
obs_asg_max_size         = 1
obs_scaledown_desired    = 0
obs_scaledown_recurrence = "00 19 * * 1-5"
obs_scaleup_desired      = 1
obs_scaleup_recurrence   = "00 04 * * 1-5"

## ibs
ibs_instance_type        = "m3.medium"
ibs_puppet_nodetype      = "ibs"
ibs_asg_min_size         = 0
ibs_asg_max_size         = 1
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 19 * * 1-5"
ibs_scaleup_desired      = 1
ibs_scaleup_recurrence   = "10 04 * * 1-5"

## fyndi-f
fyndi-f_instance_type        = "m3.medium"
fyndi-f_puppet_nodetype      = "fyndi-front"
fyndi-f_asg_min_size         = 0
fyndi-f_asg_max_size         = 1
fyndi-f_scaledown_desired    = 0
fyndi-f_scaledown_recurrence = "00 19 * * 1-5"
fyndi-f_scaleup_desired      = 1
fyndi-f_scaleup_recurrence   = "00 04 * * 1-5"

## fyndi_back
fyndi-b_instance_type        = "m3.medium"
fyndi-b_puppet_nodetype      = "fyndi-back"
fyndi-b_asg_min_size         = 0
fyndi-b_asg_max_size         = 1
fyndi-b_scaledown_desired    = 0
fyndi-b_scaledown_recurrence = "00 19 * * 1-5"
fyndi-b_scaleup_desired      = 1
fyndi-b_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-front
wildfly-front_instance_type        = "t2.medium"
wildfly-front_puppet_nodetype      = "tars-front"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 1
wildfly-front_scaledown_desired    = 0
wildfly-front_scaledown_recurrence = "00 19 * * 1-5"
wildfly-front_scaleup_desired      = 1
wildfly-front_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-messaging
wildfly-messaging_instance_type        = "t3.medium"
wildfly-messaging_puppet_nodetype      = "tars-messaging"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 1
wildfly-messaging_scaledown_desired    = 1
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_desired      = 1
wildfly-messaging_scaleup_recurrence   = "00 04 * * 1-5"

## wildfly-mock
wildfly-mock_instance_type        = "t2.medium"
wildfly-mock_puppet_nodetype      = "mock"
wildfly-mock_asg_min_size         = 0
wildfly-mock_asg_max_size         = 1
wildfly-mock_scaledown_desired    = 0
wildfly-mock_scaledown_recurrence = "00 19 * * 1-5"
wildfly-mock_scaleup_desired      = 1
wildfly-mock_scaleup_recurrence   = "00 04 * * 1-5"

## cpc-back
cpc-back_instance_type        = "m3.medium"
cpc-back_puppet_nodetype      = "cpc-back"
cpc-back_asg_min_size         = 0
cpc-back_asg_max_size         = 1
cpc-back_scaledown_desired    = 0
cpc-back_scaledown_recurrence = "00 19 * * 1-5"
cpc-back_scaleup_desired      = 1
cpc-back_scaleup_recurrence   = "00 04 * * 1-5"

## cpc-front
cpc-front_instance_type        = "m3.medium"
cpc-front_puppet_nodetype      = "cpc-front"
cpc-front_asg_min_size         = 0
cpc-front_asg_max_size         = 1
cpc-front_scaledown_desired    = 0
cpc-front_scaledown_recurrence = "00 19 * * 1-5"
cpc-front_scaleup_desired      = 1
cpc-front_scaleup_recurrence   = "00 04 * * 1-5"

## sftpplus-svr
sftpplus-svr_instance_type        = "t2.medium"
sftpplus-svr_puppet_nodetype      = "sftpplus-svr"
sftpplus-svr_asg_min_size         = 0
sftpplus-svr_asg_max_size         = 1
sftpplus-svr_scaledown_desired    = 0
sftpplus-svr_scaledown_recurrence = "00 19 * * 1-5"
sftpplus-svr_scaleup_desired      = 1
sftpplus-svr_scaleup_recurrence   = "00 04 * * 1-5"

### Business Objects
bobj_asg_max_size = 1
bobj_asg_min_size = 0
bobj_instance_type = "m5.xlarge"

## Xenco
xenco_key_name = ""
xenco_asg_max_size = "1"
xenco_asg_min_size = "1"
xenco_instance_type = "t2.small"


## cpc-batch
cpc-batch_instance_type        = "m3.medium"
cpc-batch_puppet_nodetype      = "cpc-batch"
cpc-batch_asg_min_size         = 0
cpc-batch_asg_max_size         = 1
cpc-batch_scaledown_desired    = 0
cpc-batch_scaledown_recurrence = "00 19 * * 1-5"
cpc-batch_scaleup_desired      = 1
cpc-batch_scaleup_recurrence   = "00 04 * * 1-5"


## apache
apache_instance_type         = "m3.medium"
apache_asg_min_size          = 0
apache_asg_max_size          = 1
apache_scaledown_desired     = 0
apache_scaledown_recurrence  = "00 19 * * 1-5"
apache_scaleup_desired       = 1
apache_scaleup_recurrence    = "00 04 * * 1-5"
apache_ami_build_id          = "593"

## AWS MQ
aws_mq_engine_type             = "ActiveMQ"
aws_mq_engine_version          = "5.15.9"
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
aws_mq_users_cpc_batch_user          = "cpc_batch"
aws_mq_users_cpc_batch_password      = "password123456"
aws_mq_users_cpc_batch_group         = "cpc_batch"

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
xe_ami_name = "OracleXE"

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

grafana_alb_subnets_cidrs = [
  "10.167.60.160/28",
  "10.167.60.176/28",
  "10.167.60.192/28",
]

ctrl_grafana_subnets = [
  "10.167.60.208/28",
  "10.167.60.224/28",
  "10.167.60.240/28",
]

payments_whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "148.253.134.213/32", # BJSS VPN 04/18
  "54.72.37.158/32",    # Selenium Elasticgrid Proxy
  "54.76.206.25/32",    # Perf01 NATGW IP
  "185.8.52.254/32",    # Start Barclays IP
  "185.8.53.254/32",
  "185.8.54.254/32",
  "212.23.45.97/32",
  "212.35.124.164/32",  # End Barclays IP
]

whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "10.201.80.0/21", # DVSA Notts Internal
  "10.69.3.64/26",      # DVSA ZPA VPN
  "10.69.131.64/26",    # DVSA ZPA VPN
  "148.253.134.213/32", # BJSS VPN 04/18
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
  "45.223.0.0/16",      # End Incapsula IPs
  "54.76.206.25/32",    # Perf01 NATGW IP
  "10.69.3.15/32",      # Begin DVSA MS-RDS
  "10.69.3.16/32",
  "10.69.3.17/32",
  "10.69.3.18/32",
  "10.69.1.70/31",
  "10.84.192.159/32",
  "10.84.192.161/32",      # End DVSA MS-RDS
  "85.115.53.201/32",   #DSCALLARDS
  "80.194.75.82/32",    #DSCALLARDS
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
  "10.14.0.150/32",
  "10.69.0.0/16",
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

dvsa_mgmt_inbound = [
  "10.84.192.0/23",
  "10.69.3.4/32"
]

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

cwl_retention_days = "30"

# Used for DTC printer queue lookups
dvsa_ldap_server = "10.166.0.14/32"

# IRDT printer range
dvsa_irdt_printers = "10.201.0.0/16"

# WSUS is covered above in the DC whitelist
dvsa_sccm_services = "10.84.192.157/32"
dvsa_epo_services = "10.84.192.158/32"

# 3rd party
avarto_sftp_server = "85.133.77.5/32"
sweda_samba_server = "10.69.3.11/32"
dvla_adli_server = "51.231.10.109/32"
dvla_elise_server = "51.231.10.112/32"
rsis_samba_server = "10.14.0.150/32"

# squidnat
squidnat_instance_type = "t3.micro"
squidnat_ami_build_id  = "627"

ops_team_email = "TARSStabilisation@bjss.com"

public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

# This is new. This is to start the long hike to having
# one consistent domain name structure across the project.
# This will be used by the ctrl component initially in order
# to have a private hosted zone local to the VPC that matches
# the appropriate structure. This variable can then be used
# to expand the single structure wider as different components
# become malleable. One day, all groups may share one single
# domain root and make use of it for all domain purposes,
# public *and* private
root_domain_name = "tars.dev-dvsacloud.uk"

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
payments_cert_name = "*"
tars_private_cert = "*"
tars_pdf_cert     = "*"
cpc_private_cert  = "*"
bobj_cert         = "*"

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

# TARSDB
tars_rds_storage_type = "gp2"
tars_rds_engine = "oracle-se2"
tars_rds_engine_version = "12.1.0.2.v17"
tars_rds_instance_class = "db.t3.medium" # was "db.m4.4xlarge"
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
tars_rds_sid_name = "TARSDB"

# MISDB
mis_rds_storage_type = "gp2"
mis_rds_engine = "oracle-se2"
mis_rds_engine_version = "12.1.0.2.v16"
mis_rds_instance_class = "db.t3.medium" # was "db.m4.4xlarge"
mis_rds_port = "1521"
mis_rds_public = "false"
mis_rds_multi_az = "false" # it takes an age to build if true
mis_rds_backup_retention = "7"
mis_rds_backup_window = "02:38-03:08"
mis_rds_maint_window = "sun:03:16-sun:03:46"
mis_rds_skip_final_snapshot = true
mis_rds_apply_immediately = "true"
mis_rds_license_model = "license-included"
mis_rds_autoscale = "True"
mis_rds_sid_name = "MISDB"

# RSISDB
rsis_rds_storage_type = "gp2"
rsis_rds_engine = "oracle-se2"
rsis_rds_engine_version = "12.1.0.2.v16"
rsis_rds_instance_class = "db.t3.medium" # was "db.m4.4xlarge"
rsis_rds_port = "1521"
rsis_rds_public = "false"
rsis_rds_multi_az = "false" # it takes an age to build if true
rsis_rds_backup_retention = "7"
rsis_rds_backup_window = "02:38-03:08"
rsis_rds_maint_window = "sun:03:16-sun:03:46"
rsis_rds_skip_final_snapshot = true
rsis_rds_apply_immediately = "true"
rsis_rds_license_model = "license-included"
rsis_rds_autoscale = "True"
rsis_rds_sid_name = "RSISDB"

# CPCDB
cpc_rds_storage_type = "gp2"
cpc_rds_engine = "oracle-se2"
cpc_rds_engine_version = "12.1.0.2.v16"
cpc_rds_instance_class = "db.t3.medium" # was "db.m4.4xlarge"
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
cpc_rds_sid_name = "CPCDB"

# DMS Replication instance
tars_dms_allocated_storage = "50"
tars_dms_apply_immediately = true
tars_dms_auto_minor_version_upgrade = true
tars_dms_engine_version = "2.4.2"
tars_dms_multi_az = false
tars_dms_maint_window = "sun:03:16-sun:03:46"
tars_dms_publicly_accessible = false
tars_dms_replication_instance_class = "dms.t2.medium"

# IBSDB
ibs_rds_instance_class = "db.t2.small" //Aurora doesn't support t2.micro
ibs_rds_backup_retention_period = "7"
ibs_rds_backup_window = "02:38-03:08"
ibs_rds_maint_window = "sun:03:16-sun:03:46"

cpc_internet_cert       = "*"
cpc_dvsa_internet_cert  = "*"
cpc_cert                = "*"
cpc_private_cert        = "*"
fyndi_cert              = "*"
tars_cert               = "*"
tars_private_cert       = "*"
tars_pdf_cert           = "*"
obs_cert                = "*"
ibs_cert                = "*"
irdt_cert               = "*"
apache_cert             = "*"
holding_pages_cert      = "*"

# DC Gateway details
dc_gateway_name = "Tars-NonProd-DirCon"
dc_gateway_aws_asn = "64514"

# DC Gateway Primary VIF
dc_primary_connection_id = "dxcon-fh1mcwcg"
dc_vif_primary_name = "Tars-NonProd-DirCon-Pri"
dc_vif_primary_vlan = "377"
dc_vif_primary_router = "10.111.0.9/30"
dc_vif_primary_aws_router = "10.111.0.10/30"
dc_vif_primary_bgp_auth_key = "43draytgKfQxy8fSRqPztnqYLRKD5U"

# DC Gateway Secondary VIF
dc_secondary_connection_id = "dxcon-ffsaclhy"
dc_vif_secondary_name = "Tars-NonProd-DirCon-Sec"
dc_vif_secondary_vlan = "319"
dc_vif_secondary_router = "10.111.8.9/30"
dc_vif_secondary_aws_router = "10.111.8.10/30"
dc_vif_secondary_bgp_auth_key = "u4ZB6sQEJJHjsUUGg69BeM6KWvqxfq"

# DC Gateway VIF parameters
dc_vif_asn = "64515"

#RDS Deletion Protection
tars_rds_delete_protect = "False"
cpc_rds_delete_protect = "False"
ibsdb_cluster_delete_protect = "False"
misdb_rds_delete_protect = "False"
risdb_rds_delete_protect = "False"
