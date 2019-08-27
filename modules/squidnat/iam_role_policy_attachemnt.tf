resource "aws_iam_role_policy_attachment" "hieradata_squidnat_0" {
  role       = "${module.microservice_squidnat_0.iam_role_name}"
  policy_arn = "${var.kms_hiera_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "hieradata_squidnat_1" {
  role       = "${module.microservice_squidnat_1.iam_role_name}"
  policy_arn = "${var.kms_hiera_user_policy_arn}"
}

resource "aws_iam_role_policy_attachment" "hieradata_squidnat_2" {
  role       = "${module.microservice_squidnat_2.iam_role_name}"
  policy_arn = "${var.kms_hiera_user_policy_arn}"
}



