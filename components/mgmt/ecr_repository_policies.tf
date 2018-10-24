# These policies should be a from data sources.
# However, AWS ECR Resource Policies still require
# Policy Version "2008-10-17" which for some reason
# terraform provides no existing support for.
# Therefore we have to construct JSON from template files.
#
# Should be:
# policy = "${data.aws_iam_policy_document.ecr_repository_main.json}"

resource "aws_ecr_repository_policy" "tars_puppet" {
  repository = "${aws_ecr_repository.tars_puppet.name}"
  policy     = "${data.template_file.ecr_repository_policy_main.rendered}"
}
