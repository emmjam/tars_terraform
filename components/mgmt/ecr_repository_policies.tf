# These policies should be a from data sources.
# However, AWS ECR Resource Policies still require
# Policy Version "2008-10-17" which for some reason
# terraform provides no existing support for.
# Therefore we have to construct JSON from template files.
#
# Should be:
# policy = "${data.aws_iam_policy_document.ecr_repository_main.json}"

resource "aws_ecr_repository_policy" "tars_build_puppet" {
  repository = aws_ecr_repository.tars_build_puppet.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_build_tars-core" {
  repository = aws_ecr_repository.tars_build_tars-core.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_build_cpc" {
  repository = aws_ecr_repository.tars_build_cpc.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_build_obs" {
  repository = aws_ecr_repository.tars_build_obs.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_build_ibs" {
  repository = aws_ecr_repository.tars_build_ibs.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_build_fyndi" {
  repository = aws_ecr_repository.tars_build_fyndi.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_build_repackage" {
  repository = aws_ecr_repository.tars_build_repackage.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_run_terraform" {
  repository = aws_ecr_repository.tars_run_terraform.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

