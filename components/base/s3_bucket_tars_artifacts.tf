# resource "aws_s3_bucket" "s3-tars-artifacts" {
#   bucket = "${var.environment}-tars-artifacts"

#   tags {
#     Name        = "${var.environment}-tars-artifacts"
#     Project     = "${var.project}"
#     Environment = "${var.environment}"
#   }
# }