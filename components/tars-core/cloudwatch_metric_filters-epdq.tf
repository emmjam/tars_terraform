resource "aws_cloudwatch_log_metric_filter" "epdq_ecom_refund_request" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-ecom-refund-request",
  )

  pattern        = "{ $.message = \"*Request*\" && $.message = \"*OPERATION=RFD*\" && $.message = \"*FLAG3D=Y*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "EcomRefundRequestCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name


  metric_transformation {
    name          = "EcomPaymentRequestCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "MotoRefundRequestCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "MotoPaymentRequestCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_card_aauthorisation_error" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-card-auth-error",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message != \"*NCERROR=\\\"0\\\"*\" && $.message = \"*NCSTATUS=\\\"5\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "CardAuthError"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*NCSTATUS=\\\"3\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "CardAuthDeclineCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*NCSTATUS=\\\"5\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "PaymentAcceptedCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*STATUS=\\\"46\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "PaymentChallengedCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_payment_challenged_accepted" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-payment-challenged-accepted",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*STATUS=\\\"46\\\"*\" && $.message = \"*NCSTATUS=\\\"5\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "PaymentChallengedAccepted"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_payment_challenged_declined" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-payment-challenged-declined",
  )

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*STATUS=\\\"46\\\"*\" && $.message = \"*NCSTATUS=\\\"2\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "PaymentChallengedDeclined"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
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

  pattern        = "{ $.message = \"*Response*\" && $.message = \"*STATUS=\\\"81\\\"*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_timings.name

  metric_transformation {
    name          = "RefundAcceptedCount"
    namespace     = "${var.environment}/epdq"
    value         = "1"
    default_value = "0"
  }
}

resource "aws_cloudwatch_log_metric_filter" "epdq_exceptions" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "epdq-exceptions",
  )

  pattern        = "{ $.exception.exception_class = \"*EPDQInterfaceException*\"}"
  log_group_name = aws_cloudwatch_log_group.tars_back_epdq_interface.name

  metric_transformation {
    name      = "ePDQException"
    namespace = "${var.environment}/epdq"
    value     = "1"
  }
}

