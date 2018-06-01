##########
# GENERAL
##############################################################################
project = "tars"

environment = "opsdev"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "opsdev"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "opsdev"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "nonprod"
    "propagate_at_launch" = "true"
  }
]

###############################################################################
# CTRL
###############################################################################

###############################################################################
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.0.0/22"

jenkinsnode_subnets_cidrs = [
  "10.167.0.0/28",
  "10.167.0.16/28",
  "10.167.0.32/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.0.64/28",
  "10.167.0.80/28",
  "10.167.0.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.0.112/28",
  "10.167.0.128/28",
  "10.167.0.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.0.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.0.176/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.1.0/27",
  "10.167.1.32/27",
  "10.167.1.64/27",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.1.96/28",
  "10.167.1.112/28",
  "10.167.1.128/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.1.160/28",
  "10.167.1.176/28",
  "10.167.1.192/28",
]

jmeter_subnets_cidrs = [
  "10.167.1.208/28",
  "10.167.1.224/28",
  "10.167.1.240/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.2.0/26",
  "10.167.2.64/26",
  "10.167.2.128/26",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.2.192/28",
  "10.167.2.208/28",
  "10.167.2.224/28",
]

elc_main_subnets_cidrs = [
  "10.167.3.96/28",
  "10.167.3.112/28",
  "10.167.3.128/28",
]

#IBS CIDR Range
ibs_subnets_cidrs = [
  "10.167.3.144/28",
  "10.167.3.160/28",
  "10.167.3.176/28",
]

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

# TARSDB
tars_rds_username = "tarsdevadmin"

tars_rds_password = "password"

# TARSDB
tars_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
tars_rds_snapshot = "tars-testdb-210218"

# Xenco temp dev box
xenconode = {
  instance_type        = "m4.large"
  ami_id               = "ami-f06bf389"
  asg_min_size         = 0
  asg_max_size         = 1
  rpms_to_install      = "gcc kernel-devel kernel-headers"
  key_name             = "deployer"
}

xenco_whitelist = [
  "77.86.30.4/32",      # BJSS VPN (Decom ~06/18)
  "148.253.134.213/32", # BJSS VPN 04/18
  "92.27.225.23/32",    # Xenco IP
  "92.27.224.62/32",    # Xenco IP
  "46.249.193.133/32",  # Xenco IP
]

# Xenco CIDR Range
xenco_subnets_cidrs = [
  "10.167.3.241/28",
]

xenco_ssh_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAglcxWvitvW4CTzgOZdQJF7FziHgkN5BIdLmjo+AqIxQqzWcGWYKYAJ7QHgKF1hT1Z6t0cYHR+AWIUb+lW2/52m0timHKftucWkTZBzEgpRrzgxhEgJJmfIE++MUtKGMPhE4lEpQ3KgrOwC1jiIkOq9R2CchYZr8rsM9abfet5tjgg/sjxvEUXI0pfByuqtm/s4XygAJMq1dIAfdJkxg9xutm/+t38dfFwbjlRJNwdCCJjBQywzrTVO69rika6gESNtHb75izagyy47HGwi9LxLZgODtAlyeVhSsfxoOgrIV6vOwBb/dEW7hz49mROp3T+2ZzXm85uDRdb/58g6BSIJ6uD81qSRf3W4cBmzB4EklKxlW5zD2aXyNxQescSmTD6VhcU+8EQlZRUhIBZ4DXfmpmQc354tFL1BHyxbqQubUtlfsX9kZUXocgt4aLnglnBbIlWaX+9NqNkOPaJIBxBQo1F6oNb97WtO9o2YBpk63vUv/wuCHH6T3jTThBYYnEveXujHUuZZeAJ11qB4jiyx4a/kjOxY7hI5NT336RCrwG1l5kM8w44XTzQzOoY9A6stsEr7DJhZ24OQ0kX9PuziMCWXLH4Z23fEM4t+tFvXFRD9K5RKASkGqNum9AViZxsZr4uLzqsUyGTOYIDrxlc1X/6s7neAWINQtWFvig4Hc= rsa-key-20180501"
