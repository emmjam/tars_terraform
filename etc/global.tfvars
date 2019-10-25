
ami_build_id = "develop/develop"
ibs_ami_id   = "develop/develop"
obs_ami_id   = "develop/develop"
fyndi_ami_id = "develop/develop"

##
# Variables needed for spot instances
##

# Spot pricing value map, generated on 21/11/2018 (USD) + 10% rounded up to 4dp
#  where there was variability across AZ the highest value was taken
#
# In an emergency, to move back to on demand replace the value with an empty string
# e.g. "t3.nano" = "" 
spot_pricing = {
  "c4.large"   = "0.0360"
  "c4.xlarge"  = "0.0720"
  "c4.2xlarge" = "0.1467"
  "c5.large"   = "0.0511"
  "c5.xlarge"  = "0.0881"
  "c5.2xlarge" = "0.1934"
  "m3.medium"  = "0.0081"
  "m3.large"   = "0.0360"
  "m4.large"   = "0.0381"
  "m4.2xlarge" = "0.1531"
  "m4.4xlarge" = "0.3023"
  "m5.large"   = "0.0427"
  "m5d.large"   = "0.0427"
  "m5.xlarge"  = "0.0865"
  "r4.xlarge"  = "0.0901"
  "r4.2xlarge" = "0.1711"
  "t2.micro"   = "0.0042"
  "t2.small"   = "0.0083"
  "t2.medium"  = "0.0165"
  "t2.large"   = "0.0333"
  "t3.nano"    = "0.0019"
  "t3.micro"   = "0.0048"
  "t3.small"   = "0.0075"
  "t3.medium"  = "0.0151"
}

rhel_spot_pricing = {
  "c4.large"   = "0.0960"
  "c4.xlarge"  = "0.1320"
  "c4.2xlarge" = "0.2067"
  "c5.large"   = "0.1111"
  "c5.xlarge"  = "0.1481"
  "c5.2xlarge" = "0.2534"
  "m3.medium"  = "0.0681"
  "m3.large"   = "0.0960"
  "m4.large"   = "0.0981"
  "m4.2xlarge" = "0.2131"
  "m4.4xlarge" = "0.3623"
  "m5.large"   = "0.1027"
  "m5d.large"   = "0.1027"
  "m5.xlarge"  = "0.1465"
  "r4.xlarge"  = "0.1501"
  "r4.2xlarge" = "0.2311"
  "t2.micro"   = "0.0642"
  "t2.small"   = "0.0683"
  "t2.medium"  = "0.0785"
  "t2.large"   = "0.0933"
  "t3.nano"    = "0.0619"
  "t3.micro"   = "0.0648"
  "t3.small"   = "0.0675"
  "t3.medium"  = "0.0751"
}

efs_backup_env  = [
  "sit01",
  "sit02",
  "uat01",
  "uat02",
  "mgmt",
  "prod"
]

metric_env  = [
  "opsdev",
  "uat01",
  "prod"
]

elise_log_group_name = "/opt/wildfly/logs/applications/elise-timing.json"