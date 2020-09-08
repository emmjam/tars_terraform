resource "aws_cloudwatch_log_group" "ibs_dsa_make_booking" {
  name = "/aws/ec2/${var.environment}/ibs/opt/tomcat/logs/DSA-MAKE-BOOKINGS.json"
}
