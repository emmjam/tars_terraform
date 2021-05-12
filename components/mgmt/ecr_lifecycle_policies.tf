resource "aws_ecr_lifecycle_policy" "tars_build_puppet" {
  repository = aws_ecr_repository.tars_build_puppet.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_run_mock" {
  repository = aws_ecr_repository.tars_run_mock.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_build_tars-core" {
  repository = aws_ecr_repository.tars_build_tars-core.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_build_cpc" {
  repository = aws_ecr_repository.tars_build_cpc.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_build_obs" {
  repository = aws_ecr_repository.tars_build_obs.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_build_ibs" {
  repository = aws_ecr_repository.tars_build_ibs.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_build_fyndi" {
  repository = aws_ecr_repository.tars_build_fyndi.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_build_repackage" {
  repository = aws_ecr_repository.tars_build_repackage.name
  policy     = local.ecr_lifecycle_policy_main
}

resource "aws_ecr_lifecycle_policy" "tars_run_terraform" {
  repository = aws_ecr_repository.tars_run_terraform.name
  policy     = local.ecr_lifecycle_policy_main
}

