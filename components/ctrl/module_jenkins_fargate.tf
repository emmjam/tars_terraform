module "jenkins_fargate" {
  source = "../../modules/jenkins_fargate"

  name        = "jenkins"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  default_tags = local.default_tags

  worker_iam_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  jenksin_worker_image  = var.jenkins_worker_image

}

