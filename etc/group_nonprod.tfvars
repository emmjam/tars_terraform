account_environment = "nonprod"

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
  "karl.gharios@bjss.com",
  "callum.massey@bjss.com",
]

power_users = [
  "allan.todd@bjss.com",
]

###############################################################################
# CONTROL
###############################################################################
ctrl_vpc_cidr = "10.167.60.0/22"

ctrl_nat_subnets_cidrs = [
  "10.167.60.0/28",
]

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

# TODO: use remote state
mgmt_bastion_subnets = [
  "10.200.1.96/28",
  "10.200.1.112/28",
  "10.200.1.128/28",
]

## jenkinsnode
ctrl_jenkinsnode = {
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

ctrl_jenkinsnode_subnets_cidrs = [
  "10.167.60.16/28",
  "10.167.60.32/28",
  "10.167.60.48/28",
]

ops_team_email = "mark.thompson@bjss.com"

public_domain_name = "dvsa.tars.dev-dvsacloud.uk"

aws_account_alias = "tarsnonprod"

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"
