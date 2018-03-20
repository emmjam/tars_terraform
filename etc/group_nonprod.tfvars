
account_environment    = "nonprod"


##
# RDS
##

# TARSDB
tars_rds_username = "tarsdevadmin"
tars_rds_password = "password"

# TARSDB
tars_rds_allocated_storage   = "20" # 20 Gigabyte - was 1500GB
tars_rds_storage_type        = "gp2"
tars_rds_engine              = "oracle-se2"
tars_rds_engine_version      = "12.1.0.2.v11"
tars_rds_instance_class      = "db.t2.micro" # was "db.m4.4xlarge"
tars_rds_port                = "1521"
tars_rds_public              = "false"
tars_rds_multi_az            = "false" # it takes an age to build if true
tars_rds_backup_retention    = "0"
tars_rds_backup_window       = "02:38-03:08"
tars_rds_maint_window        = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately   = "true"
tars_rds_license_model       = "license-included"
tars_rds_snapshot            = "tars-testdb-210218"


# # The AWS Account ID and Alias explicitly for this account
# aws_account_id    = "054631451206"
# aws_account_alias = "dvsamotdev"

# # Static values
# project                = "mot2"
# account_environment    = "dev"
# ami_owner_id           = "054631451206"
# terraform_state_bucket = "mot2-terraformscaffold-054631451206-eu-west-1"
# region                 = "eu-west-1"

# # TODO: Fix any possible dependency and kill this abomination
# azs = [
#   "eu-west-1a",
#   "eu-west-1b",
#   "eu-west-1c"
# ]

# root_domain_name = "mot.aws.dvsa"

# # TODO: base has moved to only using root_domain_name, this is still in use in mot-app but needs removing ASAP
# domain_name_suffix = ".mot.aws.dvsa"

# # The AWS Account ID used to create AMIs. Used in Data Source filtering.
# aws_account_ids = {
#   "dvsamotdev"  = "054631451206"
#   "dvsamottest" = "719728721003"
#   "dvsamotlive" = "665009369541"
#   "amazon"      = "137112412989"
#   "alertlogic"  = "239734009475"
# }

# default_tags = {
#   "Project" = "mot2"
#   "Group"   = "dev"
# }

# ##
# # CTRL Variables
# #
# # These you would normally expect to find in etc/env_eu-west-1_dev.tfvars
# # The reason this is here instead is so that the base component and the ctrl
# # component have a single source of truth as to counts in the ctrl VPC.
# # If we someday achieve "Just In Time Counting" in terraform, this can be moved
# # back to its proper home. Until then, it stays here. This is a valid pattern
# # for this variable, other ctrl-component variables should be in
# # etc/env_eu-west-1_dev.tfvars unless there is a definite need for them to be here.
# ctrl_nat_gateway_count = "1"
# # End of CTRL Variables

# # Remote component - used for blue/green remote state
# # NOTE: This is the component name, not your environment name - do NOT change
# base_component = "base"

# mail_relay_cname_target = "mail.motdev.org.uk"

# # Until shared management services are consolidated into one VPC in one account,
# # we need to select the correct mgmt environment to remote state information from
# # for the account we are working in, eg, dvsamotdev: fbmgmt, dvsamotlive: mgmt_prd, dvsamottest: mgmt_prd
# mgmt = {
#   "project"        = "mot2"
#   "aws_account_id" = "054631451206"
#   "region"         = "eu-west-1"
#   "environment"    = "fbmgmt"
#   "component"      = "fbmgmt"
# }

# # In order to begin transitioning toward there being only one
# # shared mgmt environment, globally unique, we are now defining
# # it here for reference and remote state purposes as the uniquely
# # named "mgmtprd"
# mgmtprd = {
#   "project"        = "mot2"
#   "aws_account_id" = "719728721003"
#   "region"         = "eu-west-1"
#   "environment"    = "mgmt_prd"
#   "component"      = "mgmt"
# }

# # NOTE: Initial values are for existing prod mgmt network
# # Management network details
# # NOTE: If this is outside the existing account then turn off
# #       auto accept
# auto_accept_mgmt    = "false"
# mgmt_vpc            = "vpc-ba9217df" # LIVE
# aws_account_id_mgmt = "719728721003" # LIVE
# mgmt_cidr           = "10.50.0.0/16"

# # NOTE: Initial values are for existing dev mgmt network
# # Management network details
# # NOTE: If this is outside the existing account then turn off
# #       auto accept
# peer_fbmgmt           = "1"
# fbmgmt_vpc            = "vpc-84abf7e1" # DEV
# aws_account_id_fbmgmt = "054631451206" # DEV
# fbmgmt_cidr           = "10.162.0.0/24"
# fbmgmt_rtb            = "rtb-3296af57"

# # Not all of these are used at the time of writing, however they are
# # defined for later references
# bastion_server_ips = [
#   "10.50.10.4/32",
#   "10.50.10.11/32",
#   "10.162.0.4/32",
# ]

# logging_server_ip    = "10.50.50.50"
# monitoring_server_ip = "10.50.50.32"
# yum_server_ip        = "10.50.50.100"

# # Selenium grid specific infomrations
# selenium_grid_cidr    = "10.162.0.0/24"
# selenium_grid_address = "10.162.0.6/32"

# # Environment & Component for Accessing mgmt_prd remote state
# mgmt_component = "fbmgmt"
# mgmt_env       = "fbmgmt"

# ##
# # CPMS config
# ##

# cpms_account_id = "600499240829"
# cpms_vpc_id     = "vpc-b5eb43d1"
# cpms_cidr_block = "10.163.10.0/23"

# ##
# # BRANCHING AND VERSIONING VARIABLES.
# #
# # Do not commit overrides for these in versions_ files
# # for dev environments. If your branch needs to change them,
# # change them here but do not merge the changes to master
# # unless you intend to affect all dev environments.
# #
# # If you intentionally merge changes to these values to master
# # then you must make sure your changes are reflected in the individual
# # environments' versions tfvars files in the live group,
# # e.g. etc/versions_eu-west-1_prod.tfvars.
# ##

# # Mirroring Live/Production when Blue is Active
# blue_live  = "true"
# green_live = "false"

# blue_preview  = "false"
# green_preview = "true"

# blue_testing  = "true"
# green_testing = "false"

# # Global Branch
# branch = "master"

# # Stack-scope Global Branch
# branch_stack = {
#   blue  = "master"
#   green = "master"
# }

# # Stack-scope Build IDs
# bg_build_ids = {
#   blue  = "*"
#   green = "*"
# }

# # Amazon Linux Puppet-on-Boot Branch
# puppet_branch = "master"

# # Jenkins2node
# jenkins_ami_branch = "master"
# jenkins_ami_build  = "*"

# # Testsupport
# testsupport_ami_build = "*"

# # JMeter
# jmeter_ami_branch = "master"
# jmeter_ami_build  = "*"

# # Jobs
# jobs_ami_build = "*"

# # OpenAM
# openam_ami_build = "*"

# # OpenAM
# openam_secondary_count = "0"

# # OpenDJ
# opendj_ami_build = "*"
# opendj_slave_count = "0"

# # Prometheus
# prometheus_ami_branch = "master"
# prometheus_ami_build  = "*"

# # SquidNAT
# squidnat_ami_build  = "*"

# ##
# # END OF BRANCHING AND VERSIONING VARIABLES
# ##

# publishing_live_elb_whitelist_cidrs = [
#   "213.160.121.250/32",                 # DVSA office
#   "195.89.171.5/32",                    # Kainos VPN
#   "193.195.13.0/24",                    # Kainos BFS
#   "91.222.71.98/32",                    # Kainos GDN
#   "77.86.30.4/32",                      # BJSS LEEDS
#   "148.253.134.213/32",                 # BJSS Bristol
#   "34.251.86.237/32",                   # Selenium
#   "135.196.73.204/32"                   # DVSA Nottingham
# ]

# ##
# # Instance Scale
# #
# # TODO: At some point, rename "*_asg_size_desired_on_create" to "*_asg_size_desired"
# # "desired_on_create" is used as an identifier in the microservice module to demonstrate
# # the functionality that it is only set on create-time, but there is no need to propgate
# # that naming outside of the module. Based on a wider understanding of how the infrastructure
# # scaling is managed, it is fine for these variables in this scope to simply be min, max, desired
# ##

# # Base

# squidnat_instance_type = "t2.micro"

# jenkins_asg_size_max  = "1"
# jenkins_asg_size_min  = "0"
# jenkins_instance_type = "m3.large"

# ##
# # Amazon Linux Base AMI
# ##

# base_ami = {
#   branch = "master"
#   build  = "5"
# }

# jmeter_asg_size_desired_on_create = "0"
# jmeter_asg_size_max               = "4"
# jmeter_asg_size_min               = "0"
# jmeter_instance_type              = "t2.medium"

# prometheus_asg_size_desired_on_create = "0"
# prometheus_asg_size_max               = "1"
# prometheus_asg_size_min               = "0"
# prometheus_instance_type              = "t2.medium"

# jobs_asg_size_desired_on_create = "0"
# jobs_asg_size_max               = "1"
# jobs_asg_size_min               = "0"
# jobs_instance_type              = "t2.micro"

# openam_instance_type = "c4.large"

# opendj_instance_type = "t2.medium"

# # App

# consul_asg_size_desired_on_create = "0"
# consul_asg_size_max               = "3"
# consul_asg_size_min               = "0"
# consul_instance_type              = "t2.medium"

# publishing_asg_size_desired_on_create = "0"
# publishing_asg_size_max               = "6"
# publishing_asg_size_min               = "0"
# publishing_instance_type              = "t2.small"

# openif_asg_size_desired_on_create = "0"
# openif_asg_size_max               = "3"
# openif_asg_size_min               = "0"
# openif_instance_type              = "t2.micro"

# frontend_asg_size_desired_on_create = "0"
# frontend_asg_size_max               = "6"
# frontend_asg_size_min               = "0"
# frontend_instance_type              = "t2.medium"

# api_asg_size_desired_on_create = "0"
# api_asg_size_max               = "9"
# api_asg_size_min               = "0"
# api_instance_type              = "c4.large"

# auth_asg_size_desired_on_create = "0"
# auth_asg_size_max               = "3"
# auth_asg_size_min               = "0"
# auth_instance_type              = "t2.medium"

# vehicle_asg_size_desired_on_create = "0"
# vehicle_asg_size_max               = "5"
# vehicle_asg_size_min               = "0"
# vehicle_instance_type              = "t2.medium"

# mot_test_asg_size_desired_on_create = "0"
# mot_test_asg_size_max               = "5"
# mot_test_asg_size_min               = "0"
# mot_test_instance_type              = "t2.medium"

# jasper_asg_size_desired_on_create = "0"
# jasper_asg_size_max               = "6"
# jasper_asg_size_min               = "0"
# jasper_instance_type              = "t2.large"

# ##
# # Elasticache
# ##

# # Frontend

# elc_frontend_engine          = "memcached"
# elc_frontend_engine_version  = "1.4.24"
# elc_frontend_node_type       = "cache.t2.micro" # was "cache.m3.xlarge"
# elc_frontend_cache_nodes     = "1"
# elc_frontend_parameter_group = "default.memcached1.4"
# elc_frontend_port            = "11211"

# # API

# elc_api_engine          = "memcached"
# elc_api_engine_version  = "1.4.24"
# elc_api_node_type       = "cache.t2.micro" # was "cache.m3.xlarge"
# elc_api_cache_nodes     = "1"
# elc_api_parameter_group = "default.memcached1.4"
# elc_api_port            = "11211"

# ##
# # RDS
# ##

# # MOTDB
# main_rds_allocated_storage   = "20" # 20 Gigabyte - was 1500GB
# main_rds_storage_type        = "gp2"
# main_rds_engine              = "mariadb"
# main_rds_engine_version      = "10.1.19"
# main_rds_instance_class      = "db.t2.micro" # was "db.m4.4xlarge"
# main_rds_port                = "3306"
# main_rds_public              = "false"
# main_rds_multi_az            = "false" # it takes an age to build if true
# main_rds_backup_retention    = "0"
# main_rds_backup_window       = "02:38-03:08"
# main_rds_maint_window        = "sun:03:16-sun:03:46"
# main_rds_skip_final_snapshot = "true"

# # Jasper
# jasper_rds_allocated_storage   = "20" # 20 Gigabyte - was 1500GB
# jasper_rds_storage_type        = "gp2"
# jasper_rds_engine              = "mysql"
# jasper_rds_engine_version      = "5.6.34"
# jasper_rds_instance_class      = "db.t2.micro" # was "db.m4.4xlarge"
# jasper_rds_port                = "3306"
# jasper_rds_public              = "false"
# jasper_rds_multi_az            = "false" # it takes an age to build if true
# jasper_rds_backup_retention    = "0"
# jasper_rds_backup_window       = "02:38-03:08"
# jasper_rds_maint_window        = "sun:03:16-sun:03:46"
# jasper_rds_skip_final_snapshot = "true"

# # End of RDS variables

# ##
# # Elasticsearch
# ##

# aes_data_instance_type    = "t2.small.elasticsearch"
# aes_data_instance_count   = "2"
# aes_master_instance_type  = "t2.small.elasticsearch"
# aes_master_instance_count = "2"
# aes_cidr_whitelist        = []
# aes_data_volume_size      = "10"

# ##
# # Full Anonymised RDS
# ##

# # setting used on ctrl component
# full_anonymised_database = {
#   count               = "1"
#   allocated_storage   = "1500"
#   storage_type        = "gp2"
#   engine              = "mariadb"
#   engine_version      = "10.0.17"
#   instance_class      = "db.m4.4xlarge"
#   port                = "3306"
#   public              = "false"
#   multi_az            = "false"
#   backup_retention    = "28"
#   backup_window       = "02:38-03:08"
#   maint_window        = "sun:03:16-sun:03:46"
#   skip_final_snapshot = "true"
#   snapshot_identifier = "arn:aws:rds:eu-west-1:719728721003:snapshot:mot2-nft-anon-1-rb"
# }

# ##
# # Postfix
# ##

# postfix_scaledown_desired          = "0"
# postfix_scaledown_recurrence       = "15 19 * * 1-5" # Mon-Fri @ 19:15 GMT
# postfix_scaleup_recurrence         = "45 06 * * 1-5" # Mon-Fri @ 06:45 GMT
# postfix_instance_type              = "t2.nano"
# postfix_asg_size_desired           = "1"
# postfix_asg_size_max               = "2"
# postfix_asg_size_min               = "0"
# postfix_asg_size_desired_on_create = "1"

# ##
# # EU Roadworthiness Certificates
# ##

# # TODO: Refactor this.

# cert_generation_service_nameservers = [
#   "ns-563.awsdns-06.net.",
#   "ns-1822.awsdns-35.co.uk.",
#   "ns-317.awsdns-39.com.",
#   "ns-1527.awsdns-62.org.",
# ]

# ##
# # Testers Annual Assessment api
# ##
# taa_api_usage_plan_list   = [
#   {
#     organization_name     = "DvsaTest"
#     quota_limit           = 1000
#     quota_period          = "DAY"
#     throttle_burst_limit  = 5
#     throttle_rate_limit   = 5
#   }
# ]

# taa_logs_retention        = "7"

# ## DVLASFTP 
# # DO NOT ACTIVATE THIS - it's included because it needs to be, but it doesn't work
# # in dev environments because the packer script sets the environment fact to "dev"
# # instead of "devXX"!!!
# dvlasftp_asg_size_desired_on_create = 0

# dvlasftp_ami_id        = "ami-8792f9fe"
# dvlasftp_asg_size_min  = 0
# dvlasftp_asg_size_max  = 0
# dvlasftp_instance_type = "t2.micro"

# dvlasftp_inbound_ip    = "62.25.85.1/32"
# dvlasftp_outbound_ip   = "62.25.85.3/32"

# ## Should we associate a public ip address with Jenkins Slave?
# slave_public_ip = "true"
