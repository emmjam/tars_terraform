resource "aws_route53_zone" "public_domain" {
  name          = local.vpc_domain_name
  comment       = "The environemnt level Public Hosted Zone used for ACM"
  force_destroy = "false"
}