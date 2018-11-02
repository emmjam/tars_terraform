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
# BASE
###############################################################################

#Monitoring
prometheus_asg_min_size           = 1
prometheus_asg_max_size           = 1
prometheus_instance_type          = "t2.medium"
prometheus_ami_build_id           = 372
prometheus_efs_provisioned_mibps  = 1

#EFS Backups
efs_backup_asg_min_size           = 1
efs_backup_asg_max_size           = 1
efs_backup_instance_type          = "t3.nano"
efs_backup_ami_build_id           = 309

###############################################################################
# CTRL
###############################################################################

###############################################################################
# opsdev
###############################################################################

# The VPC CIDR Block for this environment
vpc_cidr = "10.167.0.0/21"

## alb public
alb_public_subnets_cidrs = [
  "10.167.0.0/26",
  "10.167.0.64/26",
  "10.167.0.128/26",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.0.192/28",
  "10.167.0.208/28",
  "10.167.0.224/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.0.240/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.1.0/27",
  "10.167.1.32/27",
  "10.167.1.64/27",
]

tars_backend_elb_subnets_cidrs = [
  "10.167.1.96/28",
  "10.167.1.112/28",
  "10.167.1.128/28",
]

#  "10.167.1.144/28",
#  "10.167.1.160/28",

tars_messaging_alb_subnets_cidrs = [
  "10.167.1.176/28",
  "10.167.1.192/28",
  "10.167.1.208/28",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.1.224/28",
  "10.167.1.240/28",
  "10.167.2.0/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.2.16/28",
  "10.167.2.32/28",
  "10.167.2.48/28",
]

#OBS CIDR Range
obs_subnets_cidrs = [
  "10.167.2.64/28",
  "10.167.2.80/28",
  "10.167.2.96/28",
]

# CPC Front
cpc-front_subnets_cidrs = [
  "10.167.2.112/28",
  "10.167.2.128/28",
  "10.167.2.144/28",
]

cpc_backend_alb_subnets_cidrs = [
  "10.167.2.160/28",
  "10.167.2.176/28",
  "10.167.2.192/28",
]

cpc_sftp_subnets_cidrs = [
  "10.167.2.208/28",
  "10.167.2.224/28",
  "10.167.2.240/28",
]

# CPC Back
cpc-back_subnets_cidrs = [
  "10.167.3.0/28",
  "10.167.3.16/28",
  "10.167.3.32/28",
]

cpc_rds_subnets_cidrs = [
  "10.167.3.48/28",
  "10.167.3.64/28",
  "10.167.3.80/28",
]

mis_rds_subnets_cidrs = [
  "10.167.3.96/28",
  "10.167.3.112/28",
  "10.167.3.128/28",
]

# FYNDI
fyndi-f_subnets_cidrs = [
  "10.167.3.144/28",
  "10.167.3.160/28",
  "10.167.3.176/28",
]

fyndi_back_alb_subnets_cidrs = [
  "10.167.3.192/28",
  "10.167.3.208/28",
  "10.167.3.224/28",
]

# FYNDI
fyndi-b_subnets_cidrs = [
  "10.167.3.240/28",
  "10.167.4.0/28",
  "10.167.4.16/28",
]

ibs_subnets_cidrs = [
  "10.167.4.32/28",
  "10.167.4.48/28",
  "10.167.4.64/28",
]

ibs_db_subnets_cidrs = [
  "10.167.4.80/28",
  "10.167.4.96/28",
  "10.167.4.112/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.4.128/28",
  "10.167.4.144/28",
  "10.167.4.160/28",
]

xenco_lb_subnets_cidrs = [
  "10.167.4.176/28",
  "10.167.4.192/28",
  "10.167.4.208/28",
]

xenco_subnets_cidrs = [
  "10.167.4.224/28",
  "10.167.4.240/28",
  "10.167.5.0/28",
]

elc_main_subnets_cidrs = [
  "10.167.5.16/28",
  "10.167.5.32/28",
  "10.167.5.48/28",
]

batch_efs_subnets_cidrs = [
  "10.167.5.64/28",
  "10.167.5.80/28",
  "10.167.5.96/28",
]

cpc_efs_subnets_cidrs = [
  "10.167.5.112/28",
  "10.167.5.128/28",
  "10.167.5.144/28",
]

jenkinsnode_subnets_cidrs = [
  "10.167.5.160/28",
  "10.167.5.176/28",
  "10.167.5.192/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.5.208/28",
#  "10.167.5.224/28",
#  "10.167.5.240/28",
]

#  "10.167.6.0/28",
#  "10.167.6.16/28",

test_database_subnets_cidrs = [
  "10.167.6.32/27",
  "10.167.6.64/27",
  "10.167.6.96/27",
]

jmeter_subnets_cidrs = [
  "10.167.6.128/28",
  "10.167.6.144/28",
  "10.167.6.160/28",
]

third_party_subnets_cidrs = [
  "10.167.6.176/28",
  "10.167.6.192/28",
  "10.167.6.208/28",
]

owasp_subnets_cidrs = [
  "10.167.6.224/28",
  "10.167.6.240/28",
  "10.167.7.0/28",
]

prometheus_subnets_cidrs  = [
  "10.167.7.16/28",
  "10.167.7.32/28",
  "10.167.7.48/28",
]

prometheus_efs_subnets_cidrs = [
  "10.167.7.64/28",
  "10.167.7.80/28",
  "10.167.7.96/28",
]

prometheus_alb_private_cidrs = [
  "10.167.7.112/28",
  "10.167.7.128/28",
  "10.167.7.144/28",
]

sftpplus_efs_subnets_cidrs = [
  "10.167.7.160/28",
  "10.167.7.176/28",
  "10.167.7.192/28",
]

efs_backup_subnets_cidrs = [
  "10.167.7.208/28",
  "10.167.7.224/28",
  "10.167.7.240/28",
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

tars_rds_snapshot = "tars-opsdev-tars-core-tarsdb-20180720"

# CPCSDB
cpc_rds_username = "tarscpcadmin"

cpc_rds_password = "YwBWc8HvweT3Lun8"

# CPCTSDB
cpc_rds_allocated_storage = "20" # 20 Gigabyte - was 1500GB
cpc_rds_snapshot = "tars-opsdev-cpc-cpcdb-20180720"


# IBSDB
ibs_rds_username = "ibsdevadmin"

ibs_rds_password = "password"

ibs_rds_snapshot = "sit01-ibs-subnet-move"

# MISDB
mis_rds_username = "misdevadmin"
mis_rds_password = "password"
mis_rds_allocated_storage = "20"
mis_rds_snapshot = "tars-dev01-tars-dms-misopdmstg-20180720"

# RSISDB
rsis_rds_username = "rsisdevadmin"
rsis_rds_password = "password"
rsis_rds_allocated_storage = "20"
rsis_rds_snapshot = "tars-dev01-tars-dms-rsisdmssc-20180719"

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

apache_ami_build_id = 371

