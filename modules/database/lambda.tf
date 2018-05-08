#module "lambda_db_pw" {
#  source = "../../modules/lambda"
#
#  name = "${format(
#    "%s-%s-%s-%s",
#    var.project,
#    var.environment,
#    var.component,
#    var.name
#  )}"
#
#  handler = "lambda_handler"
#  runtime = "python3.6"
#  role    = "${aws_iam_role.iam_role_for_lambda.arn}"
#  timeout = "10"
#
#  environment_variables = {
#    database = "${format(
#    "%s-%s-%s-%s",
#    var.project,
#    var.environment,
#    var.component,
#    var.name
#  )}"
#
#    bucket = "${module.password_bucket.id}"
#  }
#}
