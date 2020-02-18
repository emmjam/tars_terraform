resource "aws_ecr_lifecycle_policy" "tars_build_puppet" {
  repository = aws_ecr_repository.tars_build_puppet.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_run_mock" {
  repository = aws_ecr_repository.tars_run_mock.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_build_tars-core" {
  repository = aws_ecr_repository.tars_build_tars-core.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_build_cpc" {
  repository = aws_ecr_repository.tars_build_cpc.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_build_obs" {
  repository = aws_ecr_repository.tars_build_obs.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_build_ibs" {
  repository = aws_ecr_repository.tars_build_ibs.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_build_fyndi" {
  repository = aws_ecr_repository.tars_build_fyndi.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_build_repackage" {
  repository = aws_ecr_repository.tars_build_repackage.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

resource "aws_ecr_lifecycle_policy" "tars_run_terraform" {
  repository = aws_ecr_repository.tars_run_terraform.name
  policy     = data.template_file.ecr_lifecycle_policy_main.rendered
}

