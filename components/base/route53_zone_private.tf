# Create the private R53 zone for the tars apps
# Keep it generic so it's the same across all VPC's/envs
resource "aws_route53_zone" "vpc" {
  name    = local.vpc_domain_name
  comment = "Private ${var.component} ${var.environment} ${var.private_domain_name} hosted zone"

  vpc {
    vpc_region = var.aws_region
    vpc_id     = aws_vpc.vpc.id
  }

  # See https://github.com/terraform-providers/terraform-provider-aws/issues/7805
  lifecycle {
    ignore_changes = [vpc]
  }
}

