################################################################################
#
# Squid NAT Data Sources
#
################################################################################

# AWS Availability Zones
data "aws_availability_zones" "azs" {}

# Current AWS Region
data "aws_region" "current" {
  current = "true"
}
