##########
# GENERAL
##############################################################################
project = "tars"

environment = "nonprod"

aws_region = "eu-west-1"

tf_state_bucket_prefix = "tars-terraformscaffold"

default_tags = {
  Project     = "tars"
  Environment = "nonprod"
  DVSA_Env    = "dev"
}

asg_default_tags = [
  {
    "key"                 = "Project"
    "value"               = "tars"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Environment"
    "value"               = "nonprod"
    "propagate_at_launch" = "true"
  },
  {
    "key"                 = "Group"
    "value"               = "nonprod"
    "propagate_at_launch" = "true"
  }
]

#continue using aws scaling for nonprod
aws_autoscaling_enabled = "1"

##########
# Guardduty
##############################################################################

guardduty_master_enabled = "0"
guardduty_member_enabled = "1"

# TODO: smarts: Move AMI IDs to versions file
## bastion
bastion_instance_type        = "t2.micro"
bastion_ami_build_id         = "1461"
bastion_asg_min_size         = 0
bastion_asg_max_size         = 3
bastion_scaledown_desired    = 1
bastion_scaledown_recurrence = "00 19 * * 1-5"
bastion_scaleup_desired      = 1
bastion_scaleup_recurrence   = "00 07 * * 1-5"

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

#Due to there being no wildcard cert in prod this is used.
grafana_cert_name = "*"

# TODO: smarts: Move AMI IDs to versions file
## jenkinsctrl
jenkins_worker_image             = "645711882182.dkr.ecr.eu-west-1.amazonaws.com/tars/run/jenkinsci:1.0.0"
jenkinsctrl_instance_type        = "m5a.large"
jenkinsctrl_ami_build_id         = "1346"
jenkinsctrl_executors            = 20
jenkinsctrl_asg_min_size         = 0
jenkinsctrl_asg_max_size         = 3
jenkinsctrl_scaledown_desired    = 1
jenkinsctrl_scaledown_recurrence = "00 19 * * 1-5"
jenkinsctrl_scaleup_desired      = 1
jenkinsctrl_scaleup_recurrence   = "15 07 * * 1-5"

# Alert Logic
# Enable the shipping of cloud watch logs to Alert Logic.  Empty value equals false
alert_logic = ""

##
# Cloudability Cross Account Access
##

cloudability_xacct = {
  aws_account_id = "165736516723"
  external_id    = "c00c5476-64f0-49db-81e8-02fc7811d0e0"
}
