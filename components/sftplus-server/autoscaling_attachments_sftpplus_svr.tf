resource "aws_autoscaling_attachment" "sftpplus_svr-10022" {
  autoscaling_group_name = module.sftpplus_svr.autoscaling_group_name
  alb_target_group_arn   = aws_lb_target_group.sftpplus_svr-10022.arn
}

resource "aws_autoscaling_attachment" "sftpplus_svr-10022-pub" {
  autoscaling_group_name = module.sftpplus_svr.autoscaling_group_name
  alb_target_group_arn   = aws_lb_target_group.sftpplus_svr-10022-pub.arn
}

