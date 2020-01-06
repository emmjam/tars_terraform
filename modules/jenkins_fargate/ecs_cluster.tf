resource "aws_ecs_cluster" "jenkins" {
  name = "${local.csi}-jenkins"
}