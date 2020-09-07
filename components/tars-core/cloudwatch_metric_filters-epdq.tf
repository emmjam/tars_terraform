resource "aws_cloudwatch_log_metric_filter" "epdq_ecom_refund_request" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-ecom-refund-request",
  )

  pattern        = "{ $.message = \"*Request*\" && $.message = \"*OPERATION=RFD*\" && $.message = \"*FLAG3D=Y*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "EcomRefundRequestCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_ecom_payment_request" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-ecom-payment-request",
  )

  pattern        = "{ $.message = \"*Request*\" && $.message = \"*OPERATION=SAL*\" && $.message = \"*FLAG3D=Y*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "EcomPaymentRequestCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_moto_refund_request" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-moto-refund-request",
  )

  pattern        = "{ $.message = \"*Request*\" && $.message = \"*OPERATION=RFD*\" && $.message != \"*FLAG3D*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "MotoRefundRequestCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_moto_payment_request" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-moto-payment-request",
  )

  pattern        = "{ $.message = \"*Request*\" && $.message = \"*OPERATION=SAL*\" && $.message != \"*FLAG3D*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "MotoPaymentRequestCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_card_authorisation_decline" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-card-auth-decline",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*nSTATUS=\\\"0\\\"*\" && $.message != \"*NCSTATUS=\\\"0\\\"*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "CardAuthDeclineCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_payment_accepted" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-payment-accepted",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*nSTATUS=\\\"9\\\"*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "PaymentAcceptedCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_payment_challenged" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-payment-challenged",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*nSTATUS=\\\"46\\\"*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "PaymentChallengedCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_refund_accepted" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-refund-accepted",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*nSTATUS=\\\"81\\\"*\"}"
  log_group_name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"

  metric_transformation {
    name      = "RefundAcceptedCount"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

