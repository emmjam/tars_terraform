resource "aws_ecs_cluster" "main" {
  name = "${local.csi}-ecs"

  tags = var.default_tags
}
