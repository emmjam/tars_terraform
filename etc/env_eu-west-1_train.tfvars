##########
# GENERAL
##############################################################################
project = "tars"

environment = "train"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "train"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "train"
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
# train
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.144.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.144.0/27",
  "10.167.144.32/27",
  "10.167.144.64/27",
]

tars_alb_internal = [
  "10.167.144.96/28",
  "10.167.144.112/28",
  "10.167.144.128/28",
]

obs_alb_internal = [
  "10.167.144.144/28",
  "10.167.144.160/28",
  "10.167.144.176/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.144.192/28",
  "10.167.144.208/28",
  "10.167.144.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.144.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.145.0/27",
  "10.167.145.32/27",
  "10.167.145.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.145.96/28",
  "10.167.145.112/28",
  "10.167.145.128/28",
]

#  "10.167.145.144/28",
#  "10.167.145.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.145.176/28",
  "10.167.145.192/28",
  "10.167.145.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.145.224/28",
  "10.167.145.240/28",
  "10.167.146.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.146.16/28",
  "10.167.146.32/28",
  "10.167.146.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.146.64/28",
  "10.167.146.80/28",
  "10.167.146.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.146.112/28",
  "10.167.146.128/28",
  "10.167.146.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.146.160/28",
  "10.167.146.176/28",
  "10.167.146.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.146.208/28",
  "10.167.146.224/28",
  "10.167.146.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.147.0/28",
  "10.167.147.16/28",
  "10.167.147.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.147.48/28",
  "10.167.147.64/28",
  "10.167.147.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.147.96/28",
  "10.167.147.112/28",
  "10.167.147.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.147.144/28",
  "10.167.147.160/28",
  "10.167.147.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.147.192/28",
  "10.167.147.208/28",
  "10.167.147.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.147.240/28",
  "10.167.148.0/28",
  "10.167.148.16/28",
]

ibs_subnets_cidrs = [
  "10.167.148.32/28",
  "10.167.148.48/28",
  "10.167.148.64/28",
]

tars_dvsa_alb_cidrs = [
  "10.167.148.80/28",
  "10.167.148.96/28",
  "10.167.148.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.148.128/28",
  "10.167.148.144/28",
  "10.167.148.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.148.176/28",
  "10.167.148.192/28",
  "10.167.148.208/28",
]

xenco_subnets_cidrs = [
  "10.167.148.224/28",
  "10.167.148.240/28",
  "10.167.149.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.149.16/28",
  "10.167.149.32/28",
  "10.167.149.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.149.64/28",
  "10.167.149.80/28",
  "10.167.149.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.149.112/28",
  "10.167.149.128/28",
  "10.167.149.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.149.160/28",
  "10.167.149.176/28",
  "10.167.149.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.149.208/28",
]

apache_subnet_cidrs = [
  "10.167.149.224/28",
  "10.167.149.240/28",
  "10.167.150.0/28",
]

#  "10.167.150.16/28",

sftpplus_nlb_subnets_cidrs = [
  "10.167.150.32/28",
  "10.167.150.48/28",
  "10.167.150.64/28",
]

tars_backend_api_alb_subnets_cidrs = [
  "10.167.150.80/28",
  "10.167.150.96/28",
  "10.167.150.112/28",
]

jmeter_subnets_cidrs = [
  "10.167.150.128/28",
  "10.167.150.144/28",
  "10.167.150.160/28",
]

cpc_alb_internal = [
  "10.167.150.176/28",
  "10.167.150.192/28",
  "10.167.150.208/28",
]

bobj_subnets_cidrs = [
  "10.167.150.224/28",
  "10.167.150.240/28",
  "10.167.151.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.151.16/28",
  "10.167.151.32/28",
  "10.167.151.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.151.64/28",
  "10.167.151.80/28",
  "10.167.151.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.151.112/28",
  "10.167.151.128/28",
  "10.167.151.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.151.160/28",
  "10.167.151.176/28",
  "10.167.151.192/28",
]

# Deployer pub key
deployer_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwhudeCEOKgq7jteyQjvVSO8uKpdbwww94azylwjnFxsFGcmXG4ObL1oOFibHMN0x+SsSwjfC1DEziWPK3m/Crmar0+ad/68nQC+iWo/MYclh8h3bkKlv9dO4Xtv/0H6uDRW3l3bBO0rWYbt46fMAOCqX96N3LRTfUlPuzsVAd0NGZZlSSAZF0AMl4xE/tZl2m+Dqylrjp3qLT4UxEIrAuvPW06PqkGy63hZznjCjQDaadOAUpY19ZaA71JBueyGBnZ8pSVzr5hT1TpNw/cXxA6WLj4CCipIVm0M64OT/ArqcnQMX9Htf4Gp5apXZ3f6MerfjgHnkrm1t6JNuhSjVB deployer@mgmt.tars.dvsa.aws"

##
# RDS
##

# TARSDB
tars_rds_username = "tarsuatadmin"

tars_rds_password = "Bwk3H<f'-S}KyYqmQ*Ma>9>8~}}x$<"

# TARSDB
tars_rds_allocated_storage = "300"
tars_rds_snapshot = ""
tars_rds_autoscale = "False"


# CPCSDB
cpc_rds_username = "cpcadmin"

cpc_rds_password = "Mg28yDQjuEWndbtz"

# CPCTSDB
cpc_rds_allocated_storage = "100" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = ""


# IBSDB
ibs_rds_username = "ibsuatadmin"

ibs_rds_password = "password"

ibs_rds_snapshot = "sit01-ibs-subnet-move"

# MISDB
mis_rds_username = "misdmsadmin"
mis_rds_password = "password"
mis_rds_allocated_storage = "300"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

# RSISDB
rsis_rds_username = "tarsrsisadmin"
rsis_rds_password = "password"
rsis_rds_allocated_storage = "80"
rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"

#############################################################################
# VPC to DVSA WAN via DX
#############################################################################

# New World
dvsa_wan_connectivity_enabled = true

# Old World
transit_peering_enabled = false

#############################################################################
# DVSA AD VPC peering
#############################################################################

ad_peering_enabled = false
ad_peering_vpc = "vpc-02072cb35506d9b73"
ad_account = "233824316563"

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

xenco_ssh_pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAglcxWvitvW4CTzgOZdQJF7FziHgkN5BIdLmjo+AqIxQqzWcGWYKYAJ7QHgKF1hT1Z6t0cYHR+AWIUb+lW2/52m0timHKftucWkTZBzEgpRrzgxhEgJJmfIE++MUtKGMPhE4lEpQ3KgrOwC1jiIkOq9R2CchYZr8rsM9abfet5tjgg/sjxvEUXI0pfByuqtm/s4XygAJMq1dIAfdJkxg9xutm/+t38dfFwbjlRJNwdCCJjBQywzrTVO69rika6gESNtHb75izagyy47HGwi9LxLZgODtAlyeVhSsfxoOgrIV6vOwBb/dEW7hz49mROp3T+2ZzXm85uDRdb/58g6BSIJ6uD81qSRf3W4cBmzB4EklKxlW5zD2aXyNxQescSmTD6VhcU+8EQlZRUhIBZ4DXfmpmQc354tFL1BHyxbqQubUtlfsX9kZUXocgt4aLnglnBbIlWaX+9NqNkOPaJIBxBQo1F6oNb97WtO9o2YBpk63vUv/wuCHH6T3jTThBYYnEveXujHUuZZeAJ11qB4jiyx4a/kjOxY7hI5NT336RCrwG1l5kM8w44XTzQzOoY9A6stsEr7DJhZ24OQ0kX9PuziMCWXLH4Z23fEM4t+tFvXFRD9K5RKASkGqNum9AViZxsZr4uLzqsUyGTOYIDrxlc1X/6s7neAWINQtWFvig4Hc= rsa-key-20180501"

private_cert_domain_name = "dvsa.tars.dev-dvsacloud.uk"

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""