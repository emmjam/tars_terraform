# These policies should be a from data sources.
# However, AWS ECR Resource Policies still require
# Policy Version "2008-10-17" which for some reason
# terraform provides no existing support for.
# Therefore we have to construct JSON from template files.
#
# Should be:
# policy = "${data.aws_iam_policy_document.ecr_repository_main.json}"

resource "aws_ecr_repository_policy" "epdq" {
  repository = aws_ecr_repository.epdq.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "epdq_db" {
  repository = aws_ecr_repository.epdq_db.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "gov_gateway_mocktars_run_jenkins" {
  repository = aws_ecr_repository.government_gateway_mock.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "wildfly11" {
  repository = aws_ecr_repository.wildfly11.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tomcat8" {
  repository = aws_ecr_repository.tomcat8.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tomcat9" {
  repository = aws_ecr_repository.tomcat9.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "oracle-xe" {
  repository = aws_ecr_repository.oracle-xe.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "cpc-oracle-xe" {
  repository = aws_ecr_repository.cpc-oracle-xe.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_run_jenkins" {
  repository = aws_ecr_repository.jenkins.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

resource "aws_ecr_repository_policy" "tars_run_mock" {
  repository = aws_ecr_repository.tars_run_mock.name
  policy     = data.template_file.ecr_repository_policy_main.rendered
}

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

