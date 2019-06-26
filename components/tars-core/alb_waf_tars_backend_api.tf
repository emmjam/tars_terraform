#WAF ACL Rules for TARS Backend ALB
resource "aws_wafregional_ipset" "mes-ipset" {
  name = "${local.csi}-mes-ipset"

  ip_set_descriptor {
    type  = "IPV4"
    value = "${var.mes_cidr_block[0]}"
  }
}

resource "aws_wafregional_rate_based_rule" "mes-wafrule" {
  depends_on  = ["aws_wafregional_ipset.mes-ipset"]
  name        = "${local.csi}-mes-wafrule"
  metric_name = "TARSMesWAFrule"

  rate_key   = "IP"
  rate_limit = 2000

  predicate {
    data_id = "${aws_wafregional_ipset.mes-ipset.id}"
    negated = false
    type    = "IPMatch"
  }
}

resource "aws_wafregional_web_acl" "mes-wafacl" {
  name        = "${local.csi}-webacl"
  metric_name = "TARSMesWAFwebacl"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = "${aws_wafregional_rate_based_rule.mes-wafrule.id}"
    type     = "RATE_BASED"
  }
}

resource "aws_wafregional_web_acl_association" "mes-acl-assoc" {
  resource_arn = "${aws_alb.tars-alb-backend-api.arn}"
  web_acl_id   = "${aws_wafregional_web_acl.mes-wafacl.id}"
}



