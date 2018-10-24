resource "aws_ecr_lifecycle_policy" "tars_puppet" {
  repository = "${aws_ecr_repository.tars_puppet.name}"
  policy     = "${data.template_file.ecr_lifecycle_policy_main.rendered}"
}
