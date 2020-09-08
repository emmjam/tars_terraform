resource "aws_cloudwatch_log_metric_filter" "ibs_booking_complete" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "ibs-booking-complete",
  )

  pattern        = "{ $.message = \"*Booking Complete*\"}"
  log_group_name = aws_cloudwatch_log_group.ibs_dsa_make_booking.name

  metric_transformation {
    name      = "IBSBookingComplete"
    namespace = "${var.environment}/ibs"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "ibs_booking_amended" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "ibs-booking-amended",
  )

  pattern        = "{ $.message = \"*Booking Amended*\"}"
  log_group_name = aws_cloudwatch_log_group.ibs_dsa_make_booking.name

  metric_transformation {
    name      = "IBSBookingAmended"
    namespace = "${var.environment}/ibs"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "ibs_booking_cancelled" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "ibs-booking-cancelled",
  )

  pattern        = "{ $.message = \"*Booking Cancelled*\"}"
  log_group_name = aws_cloudwatch_log_group.ibs_dsa_make_booking.name

  metric_transformation {
    name      = "IBSBookingCancelled"
    namespace = "${var.environment}/ibs"
    value     = "1"
  }
}

