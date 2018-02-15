##########
# GENERAL
##############################################################################
project     = "cvs"
environment = "nonprod"
aws_region  = "eu-west-1"

tf_state_bucket_prefix = "dvsa.cvs.tf"

default_tags = {
  Project     = "cvs"
  Environment = "nonprod"
}

private_domain_name = "cvs.dvsa.aws"

##########
# ACCOUNT
###############################################################################
aws_account_alias = "dvsacvsnonprod"

public_domain_name = "nonprod.cvs.dvsacloud.uk"

users = [
  #"s.mincewicz@kainos.com", # created by Account Owner
  "c.junk@kainos.com",
  "rob.hart@dvsa.gov.uk",
  "ross.faulds@bjss.com",
  "ammar.haider@bjss.com",
  "daniel.childs@bjss.com",
  "simon.coope@bjss.com",
]

administrators = [
  #"s.mincewicz@kainos.com", # created by Account Owner
  "c.junk@kainos.com",
  "rob.hart@dvsa.gov.uk",
  "simon.coope@bjss.com",
]

power_users = [
  "ross.faulds@bjss.com",
  "ammar.haider@bjss.com",
  "daniel.childs@bjss.com",
]

##########
# CONTROL
###############################################################################
ctrl_vpc_cidr = "10.20.0.0/16"

ctrl_nat_subnets_cidrs = [
  "10.20.1.0/28",
]

mgmt = {
  aws_account_id         = "086658912680"
  aws_region             = "eu-west-1"
  project                = "cvs"
  environment            = "mgmt"
  component              = "mgmt"
  vpc_id                 = "vpc-59eab63e"  # TODO: use remote state
  vpc_cidr_block         = "10.1.0.0/16"   # TODO: use remote state
  tf_state_bucket_prefix = "dvsa.cvs.tf"   # TODO: use remote state
  jenkins_elb_subnet     = "10.1.3.32/28"  # TODO: use remote state
  gitlab_subnet          = "10.1.2.128/28" # TODO: use remote state
}

# TODO: use remote state
mgmt_bastion_subnets = [
  "10.1.1.96/28",
  "10.1.1.112/28",
  "10.1.1.128/28",
]

## jenkinsnode
jenkinsnode = {
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

jenkinsnode_subnets_cidrs = [
  "10.20.2.0/28",
  "10.20.2.16/28",
  "10.20.2.32/28",
]
