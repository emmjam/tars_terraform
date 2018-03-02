resource "aws_alb" "tars-public-facing" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "tars-public"
  )}"

  internal = "false"

  security_groups = ["${aws_security_group.tars-alb-public.id}"]

  subnets = ["${data.terraform_remote_state.base.subnets_alb_public}"]

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "tars-public"
      ),
    )
  )}"
}

# resource "aws_elb" "tars-public-facing" {
#   name = "${format(
#     "%s-%s-%s-%s",
#     var.project,
#     var.environment,
#     var.component,
#     "tars-public"
#   )}"

#   internal        = "false"
#   subnets         = ["${data.terraform_remote_state.base.subnets_elb_public}"]
#   security_groups = ["${aws_security_group.tars-elb-public.id}"]

#   cross_zone_load_balancing   = "true"
#   idle_timeout                = "400"
#   connection_draining         = "true"
#   connection_draining_timeout = "400"

#   listener {
#     instance_port     = "8080"
#     instance_protocol = "tcp"
#     lb_port           = "8080"
#     lb_protocol       = "tcp"
#     ssl_certificate_id = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"
#   }

#   listener {
#     instance_port     = "9990"
#     instance_protocol = "tcp"
#     lb_port           = "9990"
#     lb_protocol       = "tcp"
#     ssl_certificate_id = "${data.aws_acm_certificate.nonprod_tars_dvsacloud_uk.arn}"
#   }

#   health_check {
#     healthy_threshold   = "3"
#     unhealthy_threshold = "2"
#     timeout             = "10"
#     target              = "TCP:8080"
#     interval            = "15"
#   }

#   tags = "${merge(
#     var.default_tags,
#     map(
#       "Name", format(
#       "%s-%s-%s/%s",
#         var.project,
#         var.environment,
#         var.component,
#         "tars-public"
#       ),
#     )
#   )}"
# }
