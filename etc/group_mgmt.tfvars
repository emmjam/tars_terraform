# MGMT CTRL VPC

account_environment = "mgmt"

aws_account_id = "645711882182"

default_tags = {
  "Project" = "tars"
  "Group"   = "mgmt"
}

# All Users

new_all_users = [
  "adam.hall@bjss.com",
  "adrian.riley@bjss.com",
  "aiman.chaudhary@bjss.com",
  "alice.haws@dvsa.gov.uk",
  "andrew.malcolm@bjss.com",
  "andy.white2@bjss.com",
  "arthur.coombes@bjss.com",
  "balkar.bains@bjss.com",
  "billy.dhillon@bjss.com",
  "callum.massey@bjss.com",
  "chris.nappin@bjss.com",
  "christopher.swanson@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "daniel.thompson@bjss.com",
  "david.giles@bjss.com",
  "david.johnson@bjss.com",
  "david.woodley@bjss.com",
  "dimple.chauhan@bjss.com",
  "hamzaan.bridle@bjss.com",
  "ian.harris@bjss.com",
  "ibrar.akram@bjss.com",
  "irfan.sidat@bjss.com",
  "john.bower@bjss.com",
  "john.reynolds@bjss.com",
  "joseph.burgess@bjss.com",
  "josh.paveley@bjss.com",
  "luke.browning@bjss.com",
  "matthew.bell@dvsa.gov.uk",
  "michael.riley@bjss.com",
  "michael.tribbick@bjss.com",
  "michelle.pike@bjss.com",
  "neil.eaton@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "prashant.kumar@bjss.com",
  "rajkieren.manku@bjss.com",
  "richard.freitas@bjss.com",
  "rita.otoole@bjss.com",
  "saul.kashani@bjss.com",
  "stephen.davies@bjss.com",
  "stephen.davies@bjss.com",
  "steve.wilson@bjss.com",
  "steven.millington@bjss.com",
  "tom.bibb@bjss.com",
  "winston.coleman@bjss.com",
  "stephan.lewin@bjss.com",
  "david.walsh@bjss.com",
  "gavin.reid@bjss.com",
  "rebecca.howell@bjss.com",
]

# TSSOps Access

administrators_tssops_users = [
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "michael.riley@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "rajkieren.manku@bjss.com",
  "daniel.thompson@bjss.com",
  "ibrar.akram@bjss.com",
  "john.bower@bjss.com",
  "luke.browning@bjss.com",
  "ian.harris@bjss.com",
  "irfan.sidat@bjss.com",
  "david.walsh@bjss.com",
  "gavin.reid@bjss.com",
]

readonly_tssops_users = [
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "michael.riley@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "rajkieren.manku@bjss.com",
  "daniel.thompson@bjss.com",
  "ibrar.akram@bjss.com",
  "john.bower@bjss.com",
  "luke.browning@bjss.com",
  "ian.harris@bjss.com",
  "irfan.sidat@bjss.com",
  "david.walsh@bjss.com",
  "gavin.reid@bjss.com",
  "rebecca.howell@bjss.com",
]

# TARS Platform Access

administrators_platform_users = [
  "stephen.davies@bjss.com",
  "tom.bibb@bjss.com",
  "steve.wilson@bjss.com",
  "michelle.pike@bjss.com",
  "callum.massey@bjss.com",
  "michael.tribbick@bjss.com",
]

readonly_platform_users = [
  "stephen.davies@bjss.com",
  "tom.bibb@bjss.com",
  "steve.wilson@bjss.com",
  "michelle.pike@bjss.com",
  "callum.massey@bjss.com",
  "michael.tribbick@bjss.com",
]

# Developer Access

readonly_developer_users = [
  "andy.white2@bjss.com",
  "david.woodley@bjss.com",
  "hamzaan.bridle@bjss.com",
  "adrian.riley@bjss.com",
  "joseph.burgess@bjss.com",
  "chris.nappin@bjss.com",
  "josh.paveley@bjss.com",
  "aiman.chaudhary@bjss.com",
  "richard.freitas@bjss.com",
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
  "winston.coleman@bjss.com",
  "steven.millington@bjss.com",
  "andrew.malcolm@bjss.com",
]

# QA Engineer Access

qaengineer_users = [
  "balkar.bains@bjss.com",
  "john.reynolds@bjss.com",
  "rita.otoole@bjss.com",
  "stephan.lewin@bjss.com",
  "richard.freitas@bjss.com",
]

readonly_qaengineer_users = [
  "balkar.bains@bjss.com",
  "john.reynolds@bjss.com",
  "rita.otoole@bjss.com",
  "stephan.lewin@bjss.com",
]

# DBA Access

db_cw_users = [
  "david.giles@bjss.com",
]

dms_users = [
  "david.giles@bjss.com",
]

# To Tidy Up

all_users = [
  "david.giles@bjss.com",
]

ops_users = [
]

support_ro_users = [
]

tss_billing_ro_users = [
]

administrators = [
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
]

ops_team_email = "TARSStabilisation@bjss.com"
