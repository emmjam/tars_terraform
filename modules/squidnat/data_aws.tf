################################################################################
#
# Squid NAT Data Sources
#
################################################################################

# AWS Availability Zones
data "aws_availability_zones" "azs" {}

data "aws_region" "current" {}
