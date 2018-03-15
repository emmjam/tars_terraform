##########
# GENERAL
##############################################################################
project     = "tars"
environment = "nonprod"
aws_region  = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "nonprod"
}

private_domain_name = "tars.dvsa.aws"

##########
# ACCOUNT
###############################################################################
aws_account_alias = "tarsnonprod"

public_domain_name = "nonprod.tars.dvsacloud.uk"

users = [
  "rob.hart@dvsa.gov.uk",
  "karl.gharios@bjss.com",
]

administrators = [
  "mark.thompson@bjss.com",
]

power_users = [
  "karl.gharios@bjss.com",
]

###############################################################################
# CONTROL
###############################################################################
ctrl_vpc_cidr = "10.210.0.0/16"

ctrl_nat_subnets_cidrs = [
  "10.210.1.0/28",
]

mgmt = {
  aws_account_id         = "645711882182"
  aws_region             = "eu-west-1"
  project                = "tars"
  environment            = "mgmt"
  component              = "mgmt"
  vpc_id                 = "vpc-e303d285"  # TODO: use remote state
  vpc_cidr_block         = "10.200.0.0/16"   # TODO: use remote state
  tf_state_bucket_prefix = "tars-terraformscaffold"   # TODO: use remote state
  jenkins_elb_subnet     = "10.200.3.32/28"  # TODO: use remote state
  gitlab_subnet          = "10.200.2.128/28" # TODO: use remote state
}

# TODO: use remote state
mgmt_bastion_subnets = [
  "10.200.1.96/28",
  "10.200.1.112/28",
  "10.200.1.128/28",
]

## jenkinsnode
jenkinsnode = {
  instance_type        = "m4.large"
  ami_build_id         = "1"
  executors            = 5
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "15 07 * * 1-5"
}

jenkinsnode_subnets_cidrs = [
  "10.210.2.0/28",
  "10.210.2.16/28",
  "10.210.2.32/28",
]

# The VPC CIDR Block for this environment
vpc_cidr = "10.211.0.0/16"

# Remote component - used for remote state
#base_component = "mot-ci-env"

# Environment & Component for Accessing mgmt_prd remote state
mgmt_component = "mgmt"
mgmt_env       = "mgmt"

backend_subnets_cidrs = [
  "10.211.1.0/28",
  "10.211.1.16/28",
  "10.211.1.32/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.211.3.144/28",
  "10.211.3.160/28",
  "10.211.3.176/28",
]

## rds
rds_subnets_cidrs = [
  "10.211.2.0/28",
  "10.211.2.16/28",
  "10.211.2.32/28",
]

tars_core_whitelist = [
  "135.196.73.204/32",  # DVSA Notts Corp
  "213.160.121.250/32", # DVSA Notts Wifi
  "77.86.30.4/32",      # BJSS VPN
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.201/32",   # Capita (Bury St Edmunds)
  "85.115.54.202/32",   # Capita (Bury St Edmunds)
  "85.115.54.203/32",   # Capita (Bury St Edmunds)
  "85.115.54.204/32",   # Capita (Bury St Edmunds)
  "85.115.54.205/32",   # Capita (Bury St Edmunds)
  "85.115.54.206/32",   # Capita (Bury St Edmunds)
]

## wildfly-back
wildfly-back = {
  instance_type        = "t2.medium"
  puppet_env           = "dev01"
  puppet_node          = ""
  puppet_type          = ""
  puppet_kms_key       = "791140e3-1c70-4d21-943f-007c92c1e17d"
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

## wildfly-front
wildfly-front = {
  instance_type        = "t2.medium"
  puppet_env           = "dev01"
  puppet_node          = ""
  puppet_type          = ""
  puppet_kms_key       = "791140e3-1c70-4d21-943f-007c92c1e17d"
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 1
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

ami_build_id         = "27"

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

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"


# Default
# ns-619.awsdns-13.net
# ns-1293.awsdns-33.org
# ns-1979.awsdns-55.co.uk
# ns-144.awsdns-18.com

# ns-1126.awsdns-12.org.
# ns-388.awsdns-48.com.
# ns-560.awsdns-06.net.
# ns-1997.awsdns-57.co.uk.


# # Bootstrapped
# terraform_state_bucket = "mot2-terraformscaffold-719728721003-eu-west-1"

# # Specific to project
# project        = "mot2"
# region         = "eu-west-1"
# environment    = "ci"
# aws_account_id = "719728721003"

# # This map merges with other additional values provided in the group tfvars file
# default_tags = {
#   "Environment" = "ci"
# }

# # It is 100% acknowledged that this is a horrific awful and horrible
# # hack and indefensible duplication. I get it, I really do.
# # But until we have some kind of solution for this:
# # https://github.com/terraform-providers/terraform-provider-aws/issues/874
# # this is the only way I can think of to provide a single source of
# # interpolated tag insertion that works for AWS Autoscaling Groups.
# # Please don't hurt me.
# asg_default_tags = [
#   {
#     "key"                 = "Project"
#     "value"               = "mot2"
#     "propagate_at_launch" = "true"
#   },
#   {
#     "key"                 = "Environment"
#     "value"               = "ci"
#     "propagate_at_launch" = "true"
#   },
#   {
#     "key"                 = "Group"
#     "value"               = "test"
#     "propagate_at_launch" = "true"
#   }
# ]

# # The VPC CIDR Block for this environment
# vpc_cidr = "10.80.0.0/16"

# # All other per-environment variables can be extracted to here from variables.tf defaults
# ami_owner_id = "054631451206"

# # Remote component - used for blue/green remote state
# base_component = "mot-ci-env"

# # Environment & Component for Accessing mgmt_prd remote state
# mgmt_component = "mgmt"
# mgmt_env       = "mgmt_prd"

# domain_name_suffix = ".mot.aws.dvsa"

# mail_relay_cname_target = "mail.motdev.org.uk"

# logging_server_ip    = "10.50.50.50"
# monitoring_server_ip = "10.50.50.32"
# yum_server_ip        = "10.50.50.100"

# # API Microservice
# api_subnets_cidr_blue = [
#   "10.80.131.0/24",
#   "10.80.132.0/24",
#   "10.80.133.0/24",
# ]

# api_subnets_cidr_green = [
#   "10.80.134.0/24",
#   "10.80.135.0/24",
#   "10.80.136.0/24",
# ]

# api_asg_size_min  = 2
# api_asg_size_max  = 2
# api_instance_type = "c4.xlarge"

# # Publishing
# publishing_subnets_cidr_blue = [
#   "10.80.111.0/24",
#   "10.80.112.0/24",
#   "10.80.113.0/24",
# ]

# publishing_subnets_cidr_green = [
#   "10.80.114.0/24",
#   "10.80.115.0/24",
#   "10.80.116.0/24",
# ]

# publishing_asg_size_min  = 2
# publishing_asg_size_max  = 2
# publishing_instance_type = "t2.micro"

# # Vehicle
# vehicle_subnets_cidr_blue = [
#   "10.80.161.0/24",
#   "10.80.162.0/24",
#   "10.80.163.0/24",
# ]

# vehicle_subnets_cidr_green = [
#   "10.80.164.0/24",
#   "10.80.165.0/24",
#   "10.80.166.0/24",
# ]

# vehicle_asg_size_min  = 2
# vehicle_asg_size_max  = 2
# vehicle_instance_type = "t2.medium"

# # Auth
# auth_subnets_cidr_blue = [
#   "10.80.151.0/24",
#   "10.80.152.0/24",
#   "10.80.153.0/24",
# ]

# auth_subnets_cidr_green = [
#   "10.80.154.0/24",
#   "10.80.155.0/24",
#   "10.80.156.0/24",
# ]

# auth_asg_size_min  = 2
# auth_asg_size_max  = 2
# auth_instance_type = "t2.medium"

# # Frontend
# frontend_subnets_cidr_blue = [
#   "10.80.121.0/24",
#   "10.80.122.0/24",
#   "10.80.123.0/24",
# ]

# frontend_subnets_cidr_green = [
#   "10.80.124.0/24",
#   "10.80.125.0/24",
#   "10.80.126.0/24",
# ]

# frontend_asg_size_min  = 2
# frontend_asg_size_max  = 2
# frontend_instance_type = "c3.large"

# # Consul
# consul_subnets_cidr_blue = [
#   "10.80.141.0/24",
#   "10.80.142.0/24",
#   "10.80.143.0/24",
# ]

# consul_subnets_cidr_green = [
#   "10.80.144.0/24",
#   "10.80.145.0/24",
#   "10.80.146.0/24",
# ]

# consul_asg_size_min  = 3
# consul_asg_size_max  = 3
# consul_instance_type = "t2.micro"

# # jasper
# jasper_subnets_cidr_blue  = [
#   "10.80.191.0/24",
#   "10.80.192.0/24",
#   "10.80.193.0/24",
# ]

# jasper_subnets_cidr_green  = [
#   "10.80.194.0/24",
#   "10.80.195.0/24",
#   "10.80.196.0/24",
# ]

# jasper_asg_size_min  = 2
# jasper_asg_size_max  = 2
# jasper_instance_type = "c3.large"

# # open interface
# openif_subnets_cidr_blue = [
#   "10.80.181.0/24",
#   "10.80.182.0/24",
#   "10.80.183.0/24",
# ]

# openif_subnets_cidr_green = [
#   "10.80.184.0/24",
#   "10.80.185.0/24",
#   "10.80.186.0/24",
# ]

# openif_asg_size_min  = 2
# openif_asg_size_max  = 2
# openif_instance_type = "t2.micro"

# # mot test
# mot_test_subnets_cidr_blue = [
#   "10.80.171.0/24",
#   "10.80.172.0/24",
#   "10.80.173.0/24",
# ]

# mot_test_subnets_cidr_green = [
#   "10.80.174.0/24",
#   "10.80.175.0/24",
#   "10.80.176.0/24",
# ]

# mot_test_asg_size_min  = 2
# mot_test_asg_size_max  = 2
# mot_test_instance_type = "t2.medium"

# # appstack integration
# route53_zone_id = "Z21G8NFE8YXQ2I"
# mgmt_cidr       = "10.50.0.0/16"

# bastion_server_ips = [
#   "10.50.10.4/32",
#   "10.50.10.11/32",
#   "10.162.0.4/32",
# ]

# publishing_elb_subnets_cidrs = [
#   "10.80.101.0/24",
#   "10.80.102.0/24",
#   "10.80.103.0/24",
# ]

# azs = [
#   "eu-west-1a",
#   "eu-west-1b",
#   "eu-west-1c",
# ]


# fbmgmt-selenium-sg-id= "sg-75977b0c"

# # Squid
# squid_asg = {
#   min_size      = "3"
#   max_size      = "3"
#   instance_type = "t2.micro"
# }

# squid_subnets_cidrs = [
#   "10.80.251.0/24",
#   "10.80.252.0/24",
#   "10.80.253.0/24"
# ]

# squid_asg_egress_http_allowed_cidr  = [
#   "0.0.0.0/0",
# ]

# squid_asg_egress_https_allowed_cidr = [
#   "0.0.0.0/0",
# ]

# # Permanent, as squidnat will never go live in CI
# http_proxy = "squid:3128"

# ##
# # MOTI Config
# ##

# moti_webapp_elb_subnets_cidrs = [
#   "10.80.1.0/24",
#   "10.80.2.0/24",
#   "10.80.3.0/24",
# ]

# moti_webapp_elb_whitelist = [
#   "195.89.171.5/32",          # Kainos
#   "77.86.30.4/32",            # BJSS Leeds
#   "135.196.73.204/32",        # DVSA Nottingham
#   "52.16.185.15/32",          # MOT Jenkins
#   "91.222.71.98/32",          # Kainos Gdansk Primary
#   "213.160.121.250/32",       # DVSA Nottingham v2
#   "148.253.134.213/32",       # BJSS Offcies
# ]

# moti_webapp_asg_size_min  = "0"
# moti_webapp_asg_size_max  = "1"
# moti_webapp_instance_type = "t2.micro"

# moti_webapp_subnets_cidrs = [
#   "10.80.4.0/24",
#   "10.80.5.0/24",
#   "10.80.6.0/24",
# ]

# moti_processor_asg_size_min   = "0"
# moti_processor_asg_size_max   = "1"
# moti_processor_instance_type  = "t2.micro"
# processor_role_to_assume_olcs = "MOT-NDU-MOTINTEL-AssumeRole"

# moti_processor_subnets_cidrs = [
#   "10.80.7.0/24",
#   "10.80.8.0/24",
#   "10.80.9.0/24",
# ]

# olcs_aws_account_id = "146997448015"

# ##
# # FB Selenium Access Config
# ##

# fb_selenium_node_ips = [
#   "34.252.136.75/32",
#   "34.252.129.34/32",
#   "34.252.141.44/32",
#   "34.248.34.121/32",
#   "34.252.139.77/32",
#   "34.252.142.232/32",
#   "34.252.135.170/32",
#   "34.251.188.174/32",
#   "34.248.0.53/32",
#   "34.252.137.249/32",
#   "34.252.80.234/32",
#   "34.251.135.53/32",
#   "34.251.234.198/32",
#   "34.251.243.59/32",
#   "34.250.80.5/32",
#   "34.250.128.188/32",
#   "34.251.227.128/32",
#   "34.248.11.65/32",
#   "34.248.172.205/32",
#   "34.252.106.8/32",
# ]

# cpms_cidr_block = "10.163.1.0/24"

# motdev_org_uk_zone_id = "Z3217PCXDZ2GFZ" # use the one from the prod account

# mgmtprd = {
#   "project"        = "mot2"
#   "aws_account_id" = "719728721003"
#   "region"         = "eu-west-1"
#   "environment"    = "mgmt_prd"
#   "component"      = "mgmt"
# }

# ##
# # Elastic Search
# ##

# aes_data_instance_type    = "t2.small.elasticsearch"
# aes_data_instance_count   = "2"
# aes_master_instance_type  = "t2.small.elasticsearch"
# aes_master_instance_count = "2"
# aes_cidr_whitelist        = []
# aes_data_volume_size      = "10"

# ##
# # Testers Annual Assessment api
# ##

# taa_subnets_cidrs   = [
#    "10.80.218.0/28",
#    "10.80.218.16/28",
#    "10.80.218.32/28",
# ]

# taa_api_usage_plan_list   = [
#   {
#     organization_name     = "ABC"
#     quota_limit           = 1000
#     quota_period          = "DAY"
#     throttle_burst_limit  = 5
#     throttle_rate_limit   = 5
#   },
#   {
#     organization_name     = "IMI"
#     quota_limit           = 1000
#     quota_period          = "DAY"
#     throttle_burst_limit  = 5
#     throttle_rate_limit   = 5
#   },
#   {
#     organization_name     = "CandG"
#     quota_limit           = 1000
#     quota_period          = "DAY"
#     throttle_burst_limit  = 5
#     throttle_rate_limit   = 5
#   },
#   {
#     organization_name     = "DvsaTest"
#     quota_limit           = 1000
#     quota_period          = "DAY"
#     throttle_burst_limit  = 5
#     throttle_rate_limit   = 5
#   }
# ]

# taa_logs_retention  = "14"
