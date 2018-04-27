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

###############################################################################
# MGMT
###############################################################################

mgmt = {
  aws_account_id         = "645711882182"
  aws_region             = "eu-west-1"
  project                = "tars"
  environment            = "mgmt"
  component              = "mgmt"
  vpc_id                 = "vpc-e303d285"           # TODO: use remote state
  vpc_cidr_block         = "10.200.0.0/16"          # TODO: use remote state
  tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state
  jenkins_elb_subnet     = "10.200.3.32/28"         # TODO: use remote state
  gitlab_subnet          = "10.200.2.128/28"        # TODO: use remote state
}

mgmt_aws_account_id = "645711882182"
mgmt_account_id     = "645711882182"
mgmt_aws_region     = "eu-west-1"
mgmt_project        = "tars"
mgmt_environment    = "mgmt"
mgmt_component      = "mgmt"


###############################################################################
# CONTROL NONPROD
###############################################################################
ctrl_vpc_cidr = "10.167.60.0/22"

ctrl_nonprod = {
  aws_account_id         = "652856684323"
  aws_region             = "eu-west-1"
  project                = "tars"
  environment            = "nonprod"
  component              = "ctrl"
  vpc_id                 = "vpc-9f2ba7f9"           # TODO: use remote state
  vpc_cidr_block         = "10.167.60.0/22"         # TODO: use remote state
  tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state
}

ctrl_nat_subnets_cidrs = [
  "10.167.60.0/28",
]

###############################################################################
# CONTROL MGMT
###############################################################################

ctrl_mgmt = {
  aws_account_id         = "645711882182"
  aws_region             = "eu-west-1"
  project                = "tars"
  environment            = "mgmt"
  component              = "ctrl"
  vpc_id                 = "vpc-ff970799"           # TODO: use remote state
  vpc_cidr_block         = "10.167.64.0/22"         # TODO: use remote state
  tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state
}

# TODO: use remote state
# mgmt_bastion_subnets = [
#   "10.200.1.96/28",
#   "10.200.1.112/28",
#   "10.200.1.128/28",
# ]

## jenkinsnode
jenkinsctrl = {
  instance_type        = "m4.large"
  ami_build_id         = "39"
  executors            = 5
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "15 07 * * 1-5"
}

jenkinsctrl_subnets_cidrs = [
  "10.167.60.16/28",
  "10.167.60.32/28",
  "10.167.60.48/28",
]

## bastion
bastion = {
  instance_type        = "t2.micro"
  ami_build_id         = "38"
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "00 07 * * 1-5"
}

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
]

# squidnat
squidnat_instance_type = "t2.micro"

# ## ctrl peers
# ctrl_peers = [
#   {
#     account_id         = "652856684323"  # tars tars/dev01
#     vpc_id             = "vpc-61ce4107"
#     cidr_block         = "10.167.4.0/22"
#     jenkinsnode_subnet = "10.167.4.0/26"
#   },
#   {
#     account_id         = "652856684323"  # tars tars/nonprod
#     vpc_id             = "vpc-e560ef83"
#     cidr_block         = "10.167.0.0/22"
#     jenkinsnode_subnet = "10.167.0.0/26"
#   },
#   {
#     account_id         = "652856684323"  # tars tars/sit01
#     vpc_id             = "vpc-57179931"
#     cidr_block         = "10.167.8.0/22"
#     jenkinsnode_subnet = "10.167.8.0/26"
#   },
#   {
#     account_id         = "652856684323"   # tars tars/uat01
#     vpc_id             = "vpc-411b9527"
#     cidr_block         = "10.167.12.0/22"
#     jenkinsnode_subnet = "10.167.12.0/26"
#   },
# ]

ops_team_email = "mark.thompson@bjss.com"

public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

aws_account_alias = "tarsnonprod"

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

tars_rds_autoscale = "True"

# DMS Replication instance

tars_dms_allocated_storage = "50"

tars_dms_apply_immediately = true

tars_dms_auto_minor_version_upgrade = true

tars_dms_engine_version = "2.4.1"

tars_dms_multi_az = false

tars_dms_maint_window = "sun:03:16-sun:03:46"

tars_dms_publicly_accessible = false

tars_dms_replication_instance_class = "dms.t2.micro"