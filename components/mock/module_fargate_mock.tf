module "mock_fargate" {
  source = "../../modules/mock_fargate"

  name        = "mock"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id
  subnet_ids  = data.terraform_remote_state.base.outputs.subnets_tars_backend
  lb_private  = aws_alb.tars-alb-mock-public.id
  lb_public   = aws_alb.tars-alb-mock-private.id

  additional_sg_ids = list(data.terraform_remote_state.base.outputs.core_sg_id)

  default_tags = local.default_tags

  iam_policy_arn = aws_iam_policy.mock.arn
  image                 = var.mock_image

}

