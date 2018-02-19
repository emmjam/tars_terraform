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

##########
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
