resource "aws_alb" "tars-alb-backend-private" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "backend"
  )}"

  internal = true

  security_groups = ["${aws_security_group.tars-alb-backend.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_tars_backend}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "backend-private"
      ),
    )
  )}"
}



# resource "aws_elb" "tars-elb-backend-private" {
#   name = "${format(
#     "%s-%s-%s-%s-%s",
#     var.project,
#     var.environment,
#     var.component,
#     var.name,
#     "backend-private",
#   )}"

#   internal                    = true
#   cross_zone_load_balancing   = "true"
#   idle_timeout                = "400"
#   connection_draining         = "true"
#   connection_draining_timeout = "400"
#   security_groups             = ["${aws_security_group.tars-elb-backend.id}"]

#   subnets = ["${data.terraform_remote_state.base.subnets_tars_backend}"]

#   listener {
#     instance_port     = 8080
#     instance_protocol = "TCP"
#     lb_port           = 8080
#     lb_protocol       = "TCP"
#   }

#   listener {
#     instance_port     = 9990
#     instance_protocol = "TCP"
#     lb_port           = 9990
#     lb_protocol       = "TCP"
#   }

#   health_check {
#     healthy_threshold   = 3
#     unhealthy_threshold = 2
#     timeout             = 10
#     target              = "TCP:8080"
#     interval            = 15
#   }

#   tags = "${merge(
#     var.default_tags,
#     map(
#       "Name", format(
#         "%s-%s-%s/%s-%s",
#         var.project,
#         var.environment,
#         var.component,
#         var.name,
#         "elb-backend"
#       ),
#     )
#   )}"
# }
