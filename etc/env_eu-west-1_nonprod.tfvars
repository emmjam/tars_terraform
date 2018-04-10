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
}

## dev01
dev01_peers = [
  {
    account_id         = "652856684323"  # tars tars/dev01
    vpc_id             = "vpc-61ce4107"
    cidr_block         = "10.167.4.0/22"
    jenkinsnode_subnet = "10.167.4.0/26"
  },
]

## nonprod/opsdev
opsdev_peers = [
  {
    account_id         = "652856684323"  # tars tars/nonprod
    vpc_id             = "vpc-e560ef83"
    cidr_block         = "10.167.0.0/22"
    jenkinsnode_subnet = "10.167.0.0/26"
  },
]

## sit01
sit01_peers = [
  {
    account_id         = "652856684323"  # tars tars/dev01
    vpc_id             = "vpc-57179931"
    cidr_block         = "10.167.8.0/22"
    jenkinsnode_subnet = "10.167.8.0/26"
  },
]

## uat01
uat01_peers = [
  {
    account_id         = "652856684323"   # tars tars/dev01
    vpc_id             = "vpc-411b9527"
    cidr_block         = "10.167.12.0/22"
    jenkinsnode_subnet = "10.167.12.0/26"
  },
]