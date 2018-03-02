# resource "aws_alb_listener_rule" "tars_frontend_public_9990" {
#   listener_arn = "${aws_alb_listener.tars-public-8080.arn}"
#   priority     = "1"

#   action {
#     type             = "forward"
#     target_group_arn = "${aws_alb_target_group.tars-frontend-9990.arn}"
#   }

#   condition {
#     field  = "path-pattern"
#     values = ["/admin/*"]
#   }
# }
