##########
# GENERAL
##############################################################################
project = "tars"

environment = "live"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "live"
  DVSA_Env    = "prod"
}

asg_default_tags = {
  Project     = "tars"
  Environment = "live"
  Group       = "live"
}

###############################################################################
# CTRL
###############################################################################

##########
# Guardduty
##############################################################################

guardduty_master_enabled = "0"
guardduty_member_enabled = "0"

# Changed due to JIRA OPS-2184 keep bastion AMI current on weekly basis BST
## bastion
bastion_instance_type        = "t2.micro"
bastion_ami_build_id         = "1566"
bastion_asg_min_size         = 1
bastion_asg_max_size         = 3
bastion_scaledown_desired    = 1
bastion_scaledown_recurrence = "40 05 * * 1"
bastion_scaleup_desired      = 2
bastion_scaleup_recurrence   = "30 05 * * 1"

# TODO: smarts: Move AMI IDs to versions file
## Grafana
grafana_instance_type        = "t2.micro"
grafana_ami_build_id         = "1252"
grafana_asg_min_size         = 1
grafana_asg_max_size         = 1
grafana_scaledown_desired    = 1
grafana_scaledown_recurrence = "00 19 * * 1-5"
grafana_scaleup_desired      = 1
grafana_scaleup_recurrence   = "00 07 * * 1-5"

## jenkinsctrl
jenkins_worker_image             = "645711882182.dkr.ecr.eu-west-1.amazonaws.com/tars/run/jenkinsci"
jenkins_worker_tag               = "1.0.0"
jenkinsctrl_instance_type        = "m5a.large"
jenkinsctrl_ami_build_id         = "1472"
jenkinsctrl_executors            = 20
jenkinsctrl_asg_min_size         = 0
jenkinsctrl_asg_max_size         = 3
jenkinsctrl_scaledown_desired    = 1
jenkinsctrl_scaledown_recurrence = "00 19 * * 1-5"
jenkinsctrl_scaleup_desired      = 1
jenkinsctrl_scaleup_recurrence   = "15 07 * * 1-5"

#Due to there being no wildcard cert in prod this is used.
grafana_cert_name = "grafana"

spot_pricing = {
  "c4.large"   = ""
  "c4.xlarge"  = ""
  "c4.2xlarge" = ""
  "c5.large"   = ""
  "c5.xlarge"  = ""
  "c5.2xlarge" = ""
  "m3.medium"  = ""
  "m3.large"   = ""
  "m4.large"   = ""
  "m4.2xlarge" = ""
  "m4.4xlarge" = ""
  "m5.large"   = ""
  "m5a.large"  = ""
  "m5.xlarge"  = ""
  "m5a.xlarge" = ""
  "m5d.large"  = ""
  "r4.xlarge"  = ""
  "r4.2xlarge" = ""
  "t2.micro"   = ""
  "t2.small"   = ""
  "t2.medium"  = ""
  "t2.large"   = ""
  "t3.nano"    = ""
  "t3.micro"   = ""
  "t3a.micro"  = ""
  "t3.small"   = ""
  "t3a.small"  = ""
  "t3.medium"  = ""
  "t3a.medium" = ""
  "t3.large"   = ""
  "t3a.large"  = ""
}

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

# This is to trigger deployemnt of apology page deployment (s3 buckets, cloudfront) only in prod
cloudfront_enabled = "1"

##
# Cloudability Cross Account Access
##

cloudability_xacct = {
  aws_account_id = "165736516723"
  external_id    = "742a928c-22e0-41b3-8028-9cc56330473d"
}

## EBS VOLUME HOUSEKEEPING LAMBDA
# Change to '1' enable the lambda to delete any unattached EBS volumes that do not have the tag :  "protected":"do-not-delete"
ebs_housekeeping_enabled = "1"
# Delete volumes, or run in test mode (yes to delete)?
ebs_volume_delete = "no"
# Only delete volumes that were detached over X days ago
ebs_volume_days = "30"