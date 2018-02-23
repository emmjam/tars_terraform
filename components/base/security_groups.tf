# resource "aws_security_group" "ami_builder" {
#   name        = "${var.project}-${var.environment}-${var.component}-ami_builder"
#   description = "Packer AMI Builder"
#   vpc_id      = "${aws_vpc.ami_builder.id}"

#   tags = "${merge(
#     var.default_tags,
#     map(
#       "Name", format(
#         "%s-%s-%s/%s",
#         var.project,
#         var.environment,
#         var.component,
#         "ami_builder"
#       ),
#     )
#   )}"
# }