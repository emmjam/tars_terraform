# CPC ALB target group for port 8443
resource "aws_alb_target_group" "cpc-front-dvsa-internet-8443" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dvsa-inet-8443"
  )}"
  port     = "8443"
  protocol = "HTTPS"
  vpc_id   = "${data.terraform_remote_state.base.vpc_id}"

  health_check {
    path                = "/cpctrain/ping"
    protocol            = "HTTPS"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = 200
  }

}

resource "aws_autoscaling_attachment" "cpc-front-dvsa-internet-8443" {
  autoscaling_group_name = "${module.cpc-front.autoscaling_group_id}"
  alb_target_group_arn   = "${aws_alb_target_group.cpc-front-dvsa-internet-8443.arn}"
}
