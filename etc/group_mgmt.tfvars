# MGMT CTRL VPC

account_environment = "mgmt"

default_tags = {
  "Project" = "tars"
  "Group"   = "mgmt"
}

ctrl_vpc_cidr = "10.167.64.0/22"

ctrl_nat_subnets_cidrs = [
  "10.167.64.0/28",
]
mgmt_account_id = "645711882182"
mgmt = {
  aws_account_id         = "645711882182"
  aws_region             = "eu-west-1"
  project                = "tars"
  environment            = "mgmt"
  component              = "mgmt"
  vpc_id                 = "vpc-e303d285"           # TODO: use remote state
  vpc_cidr_block         = "10.200.0.0/16"          # TODO: use remote state
  tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state
}

mgmt_bastion_subnets = [
  "10.200.1.96/28",
  "10.200.1.112/28",
  "10.200.1.128/28",
]

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
  "10.167.64.16/28",
  "10.167.64.32/28",
  "10.167.64.48/28",
]

