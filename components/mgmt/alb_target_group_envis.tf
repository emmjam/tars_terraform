resource "aws_alb_target_group" "envis" {
  name        = "${local.csi}-envis"
  target_type = "lambda"
}

resource "aws_alb_target_group_attachment" "envis" {
  target_group_arn = aws_alb_target_group.envis.arn
  target_id        = module.envis.arn
  depends_on       = [aws_lambda_permission.envis]
}
