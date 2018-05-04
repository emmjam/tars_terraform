# Security group that will be attached to the rds instance
resource "aws_security_group" "main" {
  name        = "${var.environment}-${var.project}-${var.name}"
  description = "RDS internal security group"
  vpc_id      = "${var.vpc_id}"

  tags {
    "Name"        = "${var.environment}-${var.project}-${var.name}"
    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
  }
}
