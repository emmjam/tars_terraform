# MGMT CTRL VPC

account_environment = "mgmt"

aws_account_id = "645711882182"

default_tags = {
  "Project" = "tars"
  "Group"   = "mgmt"
}

all_users = [
  "rob.hart@dvsa.gov.uk",
  "mark.thompson@bjss.com",
  "brian.collinson@bjss.com",
  "steve.wilson@bjss.com",
  "chris.nappin@bjss.com",
  "michael.taylor@bjss.com",
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "michael.riley@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "stephen.davies@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "michael.tribbick@bjss.com",
  "adrian.jones@bjss.com",
  "rajkieren.manku@bjss.com",
  "neil.eaton@bjss.com",
  "david.johnson@bjss.com",
  "daniel.thompson@bjss.com",
  "berin.smaldon@bjss.com",
  "gareth.whiteside@bjss.com",
  "callum.massey@bjss.com",
  "ibrar.akram@bjss.com",
  "john.bower@bjss.com",
  "luke.browning@bjss.com",
  "martin.cavanagh@bjss.com",
  "balkar.bains@bjss.com",
  "rishi.davda@bjss.com",
]

administrators = [
  "mark.thompson@bjss.com",
  "brian.collinson@bjss.com",
  "steve.wilson@bjss.com",
  "chris.nappin@bjss.com",
  "michael.taylor@bjss.com",
  "saul.kashani@bjss.com",
  "arthur.coombes@bjss.com",
  "adam.hall@bjss.com",
  "michael.riley@bjss.com",
  "christopher.swanson@bjss.com",
  "prashant.kumar@bjss.com",
  "damian.skiba@bjss.com",
  "daniel.billing@bjss.com",
  "stephen.davies@bjss.com",
  "ogbonna.quarcoopome-harper@bjss.com",
  "michael.tribbick@bjss.com",
  "adrian.jones@bjss.com",
  "rajkieren.manku@bjss.com",
  "daniel.thompson@bjss.com",
  "berin.smaldon@bjss.com",
  "callum.massey@bjss.com",
  "ibrar.akram@bjss.com",
  "john.bower@bjss.com",
  "luke.browning@bjss.com",
]

tss_billing_ro_users = [
  "neil.eaton@bjss.com",
  "david.johnson@bjss.com",
  "gareth.whiteside@bjss.com",
]

ops_users = [
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
  "195.205.13.211/32",  # Capita (WM Proxy)
  "195.27.53.211/32",   # Capita (LD Proxy)
  "85.115.52.201/32",   # Capita (Cloud Proxy)
  "82.203.33.128/28",   # Capita (Cloud NAT Pool1)
  "82.203.33.112/28",   # Capita (Cloud NAT Pool2)
  "85.115.54.200/29",   # Capita (Bury St Edmunds)
  "165.225.81.53/32",   # DVSA Swansea
]

ops_team_email = "TARSStabilisation@bjss.com"
