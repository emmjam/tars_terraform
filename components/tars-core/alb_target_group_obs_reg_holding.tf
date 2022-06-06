resource "aws_alb_target_group" "obs_reg_holding" {
  count       = var.obs_reg_holding == true ? 1 : 0
  name        = "${local.csi}-obsreghold"
  target_type = "lambda"
}

# add obs reg holding lambda function as registered target of the target group
resource "aws_alb_target_group_attachment" "obs_reg_holding" {
  count            = var.obs_reg_holding == true ? 1 : 0
  target_group_arn = aws_alb_target_group.obs_reg_holding[count.index].arn
  target_id        = module.obs_reg_holding[count.index].arn
  depends_on       = [aws_lambda_permission.obs_reg_holding]
}
