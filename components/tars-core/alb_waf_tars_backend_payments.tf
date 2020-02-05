#WAF ACL Rules for TARS Backend ALB
resource "aws_wafregional_ipset" "payments-ipset" {
  name = "${local.csi}-payments-ipset"

  dynamic "ip_set_descriptor" {
    for_each = var.payments_whitelist
    content {
      type  = "IPV4"
      value = ip_set_descriptor.value
    }
  }
}

resource "aws_wafregional_rate_based_rule" "payments-wafrule" {
  depends_on  = [aws_wafregional_ipset.payments-ipset]
  name        = "${local.csi}-payments-wafrule"
  metric_name = "TARSPaymentsWAFrule"

  rate_key   = "IP"
  rate_limit = 1000

  predicate {
    data_id = aws_wafregional_ipset.payments-ipset.id
    negated = false
    type    = "IPMatch"
  }
}

resource "aws_wafregional_web_acl" "payments-wafacl" {
  name        = "${local.csi}-payments-webacl"
  metric_name = "TARSPaymentsWAFwebacl"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = aws_wafregional_rate_based_rule.payments-wafrule.id
    type     = "RATE_BASED"
  }
}

resource "aws_wafregional_web_acl_association" "payments-acl-assoc" {
  resource_arn = aws_alb.tars-alb-backend-payments.arn
  web_acl_id   = aws_wafregional_web_acl.payments-wafacl.id
}

