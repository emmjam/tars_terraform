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
  "m3.medium"  = "0.0101"
  "m3.large"   = "0.0360"
  "m4.large"   = "0.0750"
  "m4.2xlarge" = "0.1531"
  "m4.4xlarge" = "0.3023"
  "m5.large"   = "0.0500"
  "m5d.large"  = "0.0510"
  "m5.xlarge"  = "0.0865"
  "r4.xlarge"  = "0.0901"
  "r4.2xlarge" = "0.1711"
  "t2.micro"   = "0.0042"
  "t2.small"   = "0.0083"
  "t2.medium"  = "0.0165"
  "t2.large"   = "0.0333"
  "t3.nano"    = "0.0019"
  "t3.micro"   = "0.0048"
  "t3.small"   = "0.0125"
  "t3.medium"  = "0.0200"
  "t3.large"   = "0.0329"
  "t3a.micro"  = "0.0131"
  "t3a.small"  = "0.0166"
  "t3a.medium" = "0.0151"
  "t3a.large"  = "0.0454"
  "m5a.large"  = "0.0500"
  "m5a.xlarge" = "0.0898"
  "m6g.medium" = "0.026"
  "c6g.medium" = "0.026"
}

efs_backup_env = [
  "sit01",
  "sit02",
  "uat01",
  "uat02",
  "mgmt",
  "prod"
]

ebs_backup_env = [
  "opsdev",
  "uat01",
  "uat02"
]

efs_dbretention_env = [
  "opsdev",
  "prod"
]

dlm_time        = "03:00"
dlm_interval    = "24"
dlm_state       = "ENABLED"
dlm_retain_rule = "7"

metric_env = [
  "opsdev",
  "uat01",
  "prod"
]

elise_log_group_name           = "/opt/wildfly/logs/applications/elise-timing.json"

ibs1_ibs2_redirect_env = [
]

rsisbucket_env = [
  "opsdev",
  "prod"
]

holdingpageenv = [
  "opsdev",
  "dev01",
  "dev02",
  "sit01",
  "sit02",
  "uat01",
  "uat02",
  "uat03",
  "perf01",
  "train"
]

notifier_lambda_vars = {
  notifier_memory_size    = "512"
  notifier_lambda_timeout = "30"
  notifier_lambda_runtime = "java8"
  notifier_lambda_handler = "uk.gov.dvsa.LambdaHandler::handleRequest"
  notifier_s3_key         = "notify/notify-service-79.zip"
  notify_api_key          = ""
}


reporting_xe_alb_sg_whitelist_hosts = [
  "135.196.73.204/32",  # DVSA Notts
  "213.160.121.250/32", # DVSA Notts Corp & Wifi
  "10.201.80.0/21",     # DVSA Notts Internal
  "10.69.3.64/26",      # DVSA ZPA VPN
  "10.69.131.64/26",    # DVSA ZPA VPN
  "148.253.134.213/32", # BJSS VPN 04/18
  "54.72.37.158/32",    # Selenium Elasticgrid Proxy
  "199.83.128.0/21",    # Begin Incapsula IPs
  "198.143.32.0/19",
  "149.126.72.0/21",
  "103.28.248.0/22",
  "185.11.124.0/22",
  "192.230.64.0/18",
  "45.64.64.0/22",
  "107.154.0.0/16",
  "45.60.0.0/16",
  "45.223.0.0/16",   # End Incapsula IPs
  "54.76.206.25/32", # Perf01 NATGW IP
  "10.69.3.15/32",   # Begin DVSA MS-RDS
  "10.69.3.16/32",
  "10.69.3.17/32",
  "10.69.3.18/32",
  "10.69.1.70/31",
  "10.84.192.159/32",
  "10.84.192.161/32",
  "85.115.53.201/32", # End DVSA MS-RDS
  "80.194.75.82/32",  #DSCALLARDS
  "34.242.28.119/32", #MGMT Jenkins for url checks
  "154.14.88.249/32", # DVSA Notts Corp & Wifi
]

kms_inspector_count = 0
create_inspector_report_lambda_version = 1
email_inspector_report_lambda_version = 1

document_generation_maxbatchrecords = 1000

# Process Unknown Card Authorisations Job - Challenged Card Auth
transfer_theory_test_extract_file_to_ftts_job_directory = ""

# Reset Passwords Parameter Values
passwordreset_resetcode_codetimeout      = 30
passwordreset_resetcode_requesttimelimit = 30