##########
# GENERAL
##############################################################################
project = "tars"

environment = "perf01"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "perf01"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "perf01"
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
vpc_cidr = "10.167.16.0/22"

jenkinsnode_subnets_cidrs = [
  "10.167.16.0/28",
  "10.167.16.16/28",
  "10.167.16.32/28",
]

## alb public
alb_public_subnets_cidrs = [
  "10.167.16.64/28",
  "10.167.16.80/28",
  "10.167.16.96/28",
]

## rds
rds_subnets_cidrs = [
  "10.167.16.112/28",
  "10.167.16.128/28",
  "10.167.16.144/28",
]

# AWS MQ SINGLE_INSTANCE only requires 1 subnets
# ACTIVE_STANDBY_MULTI_AZ requires 2
awsmq_subnets_cidrs = [
  "10.167.16.160/28",
]

jenkins_nat_subnets_cidrs = [
  "10.167.16.176/28",
]

# TARS backend core/batch subnets
tars_backend_subnets_cidrs = [
  "10.167.17.0/27",
  "10.167.17.32/27",
  "10.167.17.64/27",
]

# TARS Messaging subnets
tars_messaging_subnets_cidrs = [
  "10.167.17.96/28",
  "10.167.17.112/28",
  "10.167.17.128/28",
]

#SquidNAT CIDR Range
squidnat_subnets_cidrs = [
  "10.167.17.160/28",
  "10.167.17.176/28",
  "10.167.17.192/28",
]

# TARS Frontend/IBS/OBS Web subnets
tars_web_subnets_cidrs = [
  "10.167.18.0/26",
  "10.167.18.64/26",
  "10.167.18.128/26",
]

jmeter_subnets_cidrs = [
  "10.167.17.208/28",
  "10.167.17.224/28",
  "10.167.17.240/28",
]

elc_main_subnets_cidrs = [
  "10.167.19.96/28",
  "10.167.19.112/28",
  "10.167.19.128/28",
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
tars_rds_snapshot = "tarsuat-050418"

wildfly-back_instance_type  = "m4.large"
wildfly-back_asg_min_size         = 0
wildfly-back_asg_max_size         = 2
wildfly-back_scaledown_desired    = 0
wildfly-back_scaledown_recurrence = "00 19 * * 1-5"
wildfly-back_scaleup_desired      = 2
wildfly-back_scaleup_recurrence   = "00 07 * * 1-5"

## wildfly-batch
wildfly-batch_instance_type  = "m4.large"
wildfly-batch_asg_min_size         = 0
wildfly-batch_asg_max_size         = 1
wildfly-batch_scaledown_desired    = 0
wildfly-batch_scaledown_recurrence = "00 19 * * 1-5"
wildfly-batch_scaleup_desired      = 1
wildfly-batch_scaleup_recurrence   = "00 07 * * 1-5"

## obs
obs_instance_type  = "m4.large"
obs_puppet_node    = ""
obs_puppet_type    = ""
obs_asg_min_size         = 0
obs_asg_max_size         = 3
obs_scaledown_desired    = 0
obs_scaledown_recurrence = "00 19 * * 1-5"
obs_scaleup_desired      = 1
obs_scaleup_recurrence   = "00 07 * * 1-5"

## ibs
ibs_instance_type  = "m4.large"
ibs_puppet_node    = ""
ibs_puppet_type    = ""
ibs_asg_min_size         = 0
ibs_asg_max_size         = 3
ibs_scaledown_desired    = 0
ibs_scaledown_recurrence = "00 19 * * 1-5"
ibs_scaleup_desired      = 1
ibs_scaleup_recurrence   = "00 07 * * 1-5"

## wildfly-front
wildfly-front_instance_type  = "m4.large"
wildfly-front_asg_min_size         = 0
wildfly-front_asg_max_size         = 2
wildfly-front_scaledown_desired    = 0
wildfly-front_scaledown_recurrence = "00 19 * * 1-5"
wildfly-front_scaleup_desired      = 2
wildfly-front_scaleup_recurrence   = "00 07 * * 1-5"

## wildfly-messaging
wildfly-messaging_instance_type  = "m4.large"
wildfly-messaging_asg_min_size         = 0
wildfly-messaging_asg_max_size         = 1
wildfly-messaging_scaledown_desired    = 1
wildfly-messaging_scaledown_recurrence = "00 19 * * 1-5"
wildfly-messaging_scaleup_desired      = 1
wildfly-messaging_scaleup_recurrence   = "00 07 * * 1-5"

## AWS MQ
aws_mq_host_instance_type      = "mq.t2.micro"
aws_mq_deployment_mode         = "SINGLE_INSTANCE"

# TARSDB
tars_rds_storage_type = "gp2"
tars_rds_instance_class = "db.m4.xlarge" # was "db.m4.4xlarge"
tars_rds_public = "false"
tars_rds_multi_az = "false" # it takes an age to build if true
tars_rds_backup_retention = "7"
tars_rds_backup_window = "02:38-03:08"
tars_rds_maint_window = "sun:03:16-sun:03:46"
tars_rds_skip_final_snapshot = true
tars_rds_apply_immediately = "true"
tars_rds_autoscale = "True"

## wildfly-mock
wildfly-mock_instance_type  = "t2.medium"
wildfly-mock_asg_min_size         = 0
wildfly-mock_asg_max_size         = 1
wildfly-mock_scaledown_desired    = 0
wildfly-mock_scaledown_recurrence = "00 19 * * 1-5"
wildfly-mock_scaleup_desired      = 1
wildfly-mock_scaleup_recurrence   = "00 07 * * 1-5"

##  JMeter
jmeter_instance_type              = "m5.large"
jmeter_asg_size_desired_on_create = 0
jmeter_asg_size_max               = 3
jmeter_asg_size_min               = 0

# squidnat
squidnat_instance_type = "m5.large"

