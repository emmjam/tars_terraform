# resource "aws_route_table" "backend" {
#   vpc_id = "${data.terraform_remote_state.base.vpc_id}"

#   tags = "${merge(
#     var.default_tags,
#     map(
#       "Name", format(
#         "%s-%s-%s/%s",
#         var.project,
#         var.environment,
#         var.component,
#         "backend",
#       ),
#     )
#   )}"
# }

# resource "aws_route_table" "rds" {
#   vpc_id = "${data.terraform_remote_state.base.vpc_id}"

#   tags = "${merge(
#     var.default_tags,
#     map(
#       "Name", format(
#         "%s-%s-%s/%s",
#         var.project,
#         var.environment,
#         var.component,
#         "rds",
#       ),
#     )
#   )}"
# }