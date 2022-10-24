resource "aws_autoscaling_attachment" "reporting_xe-8443" {
  count                  = var.reporting_xe_count
  autoscaling_group_name = module.microservice_reporting_xe[count.index].autoscaling_group_name
  lb_target_group_arn   = aws_alb_target_group.reporting_xe_8443[count.index].id
}




