resource "aws_route53_resolver_rule" "fwd" {
  domain_name          = "dvsa.com"
  name                 = "DVSA"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.r53_resolver_endpoint_out[0].id

  target_ip {
    ip   = "123.45.67.89"  # DNS at DVSA ?
    port = "53"
  }

  tags = {
    Name = "Forward resolver rule"
  }
}


resource "aws_route53_resolver_rule_association" "fwd" {
  resolver_rule_id = aws_route53_resolver_rule.fwd.id
  vpc_id           = aws_vpc.mgmt.id
}