# MGMT CTRL VPC

account_environment = "mgmt"

aws_account_id = "645711882182"

default_tags = {
  "Project" = "tars"
  "Group"   = "mgmt"
}

# All Users

new_all_users = [
  "ali.mohammed@bjss.com",
  "adam.hall@bjss.com",
  "alice.haws@dvsa.gov.uk",
  "andrew.malcolm@bjss.com",
  "arthur.coombes@bjss.com",
  "balkar.bains@bjss.com",
  "billy.dhillon@bjss.com",
  "christopher.swanson@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "daniel.thompson@bjss.com",
  "david.giles@bjss.com",
  "david.johnson@bjss.com",
  "david.woodley@bjss.com",
  "hamzaan.bridle@bjss.com",
  "ian.harris@bjss.com",
  "ibrar.akram@bjss.com",
  "irfan.sidat@bjss.com",
  "john.morley@bjss.com",
  "john.reynolds@bjss.com",
  "joseph.burgess@bjss.com",
  "luke.browning@bjss.com",
  "matthew.bell@dvsa.gov.uk",
  "michael.tribbick@bjss.com",
  "michelle.pike@bjss.com",
  "mike.peachey@bjss.com",
  "neil.eaton@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "prashant.kumar@bjss.com",
  "richard.freitas@bjss.com",
  "saul.kashani@bjss.com",
  "steve.wilson@bjss.com",
  "steven.millington@bjss.com",
  "jamie.kelly@bjss.com",
  "winston.coleman@bjss.com",
  "david.walsh@bjss.com",
  "rebecca.howell@bjss.com",
  "steven.bates@bjss.com",
  "usman.rasool@bjss.com",
  "chris.peska@bjss.com",
  "nadeem.khan@bjss.com",
  "matthew.turner@bjss.com",
  "richard.teasdale@bjss.com",
  "ismahil.khan@bjss.com",
  "david.smith@bjss.com",
  "jessica.ferguson@bjss.com",
  "thomas.webb@bjss.com",
  "levent.aksu@bjss.com",
  "pete.mallam@bjss.com",
  "daren.fang@bjss.com",
  "ross.bamford@bjss.com",
  "elizabeth.edwards@bjss.com",
]

# TSSOps Access

administrators_tssops_users = [
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "daniel.thompson@bjss.com",
  "ibrar.akram@bjss.com",
  "luke.browning@bjss.com",
  "mike.peachey@bjss.com",
  "ian.harris@bjss.com",
  "irfan.sidat@bjss.com",
  "david.walsh@bjss.com",
  "nadeem.khan@bjss.com",
  "david.smith@bjss.com",
  "jessica.ferguson@bjss.com",
  "pete.mallam@bjss.com",
]

readonly_tssops_users = [
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "daniel.thompson@bjss.com",
  "ibrar.akram@bjss.com",
  "luke.browning@bjss.com",
  "ian.harris@bjss.com",
  "irfan.sidat@bjss.com",
  "david.walsh@bjss.com",
  "rebecca.howell@bjss.com",
  "steven.bates@bjss.com",
  "usman.rasool@bjss.com",
  "nadeem.khan@bjss.com",
  "matthew.turner@bjss.com",
  "richard.teasdale@bjss.com",
  "ismahil.khan@bjss.com",
  "david.smith@bjss.com",
  "jessica.ferguson@bjss.com",
  "mike.peachey@bjss.com",
  "pete.mallam@bjss.com",
  "elizabeth.edwards@bjss.com",
]

# TARS Platform Access

administrators_platform_users = [
  "jamie.kelly@bjss.com",
]

 administrators_platform_nonprod_users = [
  "michelle.pike@bjss.com",
  "michael.tribbick@bjss.com",
  "nadeem.khan@bjss.com",
 ]
readonly_platform_users = [
  "jamie.kelly@bjss.com",
  "steve.wilson@bjss.com",
  "michelle.pike@bjss.com",
  "michael.tribbick@bjss.com",
  "david.giles@bjss.com",
]

# Developer Access

readonly_developer_users = [
  "david.woodley@bjss.com",
  "hamzaan.bridle@bjss.com",
  "joseph.burgess@bjss.com",
  "richard.freitas@bjss.com",
  "john.morley@bjss.com",
  "thomas.webb@bjss.com",
  "levent.aksu@bjss.com",
  "daren.fang@bjss.com",
  "ross.bamford@bjss.com",
]

# DVSA Access

readonly_dvsa_users = [
  "alice.haws@dvsa.gov.uk",
  "matthew.bell@dvsa.gov.uk",
]

# Billing Dashboard Access

billing_users = [
  "neil.eaton@bjss.com",
  "david.johnson@bjss.com",
]

# Application Support Access

readonly_appsupport_users = [
  "billy.dhillon@bjss.com",
  "steven.millington@bjss.com",
  "andrew.malcolm@bjss.com",
  "chris.peska@bjss.com",
]

# QA Engineer Access

qaengineer_users = [
  "ali.mohammed@bjss.com",
  "balkar.bains@bjss.com",
  "john.reynolds@bjss.com",
  "richard.freitas@bjss.com",
  "john.morley@bjss.com",
  "winston.coleman@bjss.com",
]

readonly_qaengineer_users = [
  "ali.mohammed@bjss.com",
  "balkar.bains@bjss.com",
  "john.reynolds@bjss.com",
  "winston.coleman@bjss.com",
]

# DBA Access

db_cw_users = [
  "david.giles@bjss.com",
]

# Non Prod

readonly_no_secrets_nonprod_users = [
]

ctrl_vpc_cidr = "10.167.64.0/22"

ctrl_nat_subnets_cidrs = [
  "10.167.64.0/28",
]

bastion_elb_subnets_cidrs = [
  "10.167.64.64/28",
  "10.167.64.80/28",
  "10.167.64.96/28",
]

ctrl_bastion_subnets = [
  "10.167.64.112/28",
  "10.167.64.128/28",
  "10.167.64.144/28",
]

grafana_alb_subnets_cidrs = [
  "10.167.64.160/28",
  "10.167.64.176/28",
  "10.167.64.192/28",
]

ctrl_grafana_subnets = [
  "10.167.64.208/28",
  "10.167.64.224/28",
  "10.167.64.240/28",
]

vpc_endpoint_subnets_cidrs = [
  "10.167.65.0/28",
  "10.167.65.16/28",
  "10.167.65.32/28",
]

cwl_retention_days = "30"

mgmt_aws_account_id         = "645711882182"
mgmt_aws_region             = "eu-west-1"
mgmt_project                = "tars"
mgmt_environment            = "mgmt"
mgmt_component              = "mgmt"
mgmt_vpc_id                 = "vpc-e303d285"           # TODO: use remote state
mgmt_vpc_cidr_block         = "10.200.0.0/16"          # TODO: use remote state
mgmt_tf_state_bucket_prefix = "tars-terraformscaffold" # TODO: use remote state

mgmt_bastion_subnets = [
  "10.200.1.96/28",
  "10.200.1.112/28",
  "10.200.1.128/28",
]

jenkinsctrl_subnets_cidrs = [
  "10.167.64.16/28",
  "10.167.64.32/28",
  "10.167.64.48/28",
]

whitelist = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "148.253.134.213/32", # BJSS VPN 04/18
  "148.253.134.212/32", # BJSS Guest Wifi 10/18
  "165.225.81.53/32",   # DVSA Swansea
  "154.14.88.249/32", # DVSA Notts Corp & Wifi
]

ops_team_email = "TARSStabilisation@bjss.com"
