resource "aws_cloudwatch_log_group" "tars_back_epdq_timings" {
  name = "/aws/ec2/${var.environment}/tars-back/opt/wildfly/logs/epdq-timings.json"
}
