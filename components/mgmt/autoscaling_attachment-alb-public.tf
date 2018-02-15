resource "aws_autoscaling_attachment" "jenkins" {
  autoscaling_group_name = "${module.jenkins.jenkins_blue_asg_name}"
  alb_target_group_arn   = "${aws_alb_target_group.jenkins.arn}"
}
