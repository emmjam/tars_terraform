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

# ###############################################################################
# # CONTROL
# ###############################################################################
# ctrl_vpc_cidr = "10.210.0.0/16"

# ctrl_nat_subnets_cidrs = [
#   "10.210.1.0/28",
# ]

# mgmt = {
#   aws_account_id         = "645711882182"
#   aws_region             = "eu-west-1"
#   project                = "tars"
#   environment            = "mgmt"
#   component              = "mgmt"
#   vpc_id                 = "vpc-e303d285"  # TODO: use remote state
#   vpc_cidr_block         = "10.200.0.0/16"   # TODO: use remote state
#   tf_state_bucket_prefix = "tars-terraformscaffold"   # TODO: use remote state
#   jenkins_elb_subnet     = "10.200.3.32/28"  # TODO: use remote state
#   gitlab_subnet          = "10.200.2.128/28" # TODO: use remote state
# }

# # TODO: use remote state
# mgmt_bastion_subnets = [
#   "10.200.1.96/28",
#   "10.200.1.112/28",
#   "10.200.1.128/28",
# ]

# ## jenkinsnode
# jenkinsnode = {
#   instance_type        = "m4.large"
#   ami_build_id         = "1"
#   executors            = 5
#   asg_min_size         = 0
#   asg_max_size         = 3
#   scaledown_desired    = 0
#   scaledown_recurrence = "00 19 * * 1-5"
#   scaleup_desired      = 1
#   scaleup_recurrence   = "15 07 * * 1-5"
# }

# jenkinsnode_subnets_cidrs = [
#   "10.210.2.0/28",
#   "10.210.2.16/28",
#   "10.210.2.32/28",
# ]

###############################################################################
# TARS
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.211.0.0/16"

## jenkinsnode
tars_jenkinsnode = {
  instance_type        = "m4.large"
  ami_build_id         = "2"
  executors            = 5
  asg_min_size         = 0
  asg_max_size         = 3
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 1
  scaleup_recurrence   = "15 07 * * 1-5"
}

tars_jenkinsnode_subnets_cidrs = [
  "10.211.4.0/28",
  "10.211.4.16/28",
  "10.211.4.32/28",
]

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
  puppet_env           = "dev"
  puppet_node          = "wildfly"
  puppet_type          = "back"  
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 2
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 2
  scaleup_recurrence   = "00 07 * * 1-5"
}

## wildfly-front
wildfly-front = {
  instance_type        = "t2.medium"
  puppet_env           = "dev"
  puppet_node          = "wildfly"
  puppet_type          = "front"  
#  ami_build_id         = "27"
  asg_min_size         = 0
  asg_max_size         = 2
  scaledown_desired    = 0
  scaledown_recurrence = "00 19 * * 1-5"
  scaleup_desired      = 2
  scaleup_recurrence   = "00 07 * * 1-5"
}

ami_build_id         = "27"


# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"
