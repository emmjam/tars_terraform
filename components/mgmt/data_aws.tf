data "aws_caller_identity" "current" {}

# All AWS Availability Zones in this region
data "aws_availability_zones" "available" {}

data "aws_region" "current" {
}
