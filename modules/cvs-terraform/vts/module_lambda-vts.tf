module "lambda_vts" {
  source = "../lambda"

  name        = "api"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  s3_bucket = "${aws_s3_bucket.main.bucket}"
  s3_key    = "packages/${var.vts_s3_key}"

  runtime     = "nodejs6.10"
  handler     = "handler.handler"
  memory_size = "${var.vts_memory_size}"
  timeout     = "${var.vts_timeout}"
  publish     = "${var.vts_publish}"

  principal_service = "apigateway"

  invoker_source_arn = "${format(
    "%s:%s:%s:%s/%s",
    "arn:aws:execute-api",
    var.aws_region,
    data.aws_caller_identity.current.account_id,
    aws_api_gateway_rest_api.main.id,
    "*/*/*"
  )}"

  env_variables = "${merge(
    var.vts_env_vars,
    map(
      "DYNAMODB_TABLE", aws_dynamodb_table.vehicle_test.id
    )
  )}"

  cwlg_retention_in_days = "${var.vts_cwlg_retention_in_days}"
  default_tags           = "${var.default_tags}"
}

data "aws_iam_policy_document" "vts" {
  statement {
    sid    = "VTSLambdaPermissions"
    effect = "Allow"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:Scan",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
    ]

    resources = [
      "${aws_dynamodb_table.vehicle_test.arn}",
    ]
  }
}

resource "aws_iam_policy" "vts" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "lambda"
  )}"

  description = "VTS specific policy"
  policy      = "${data.aws_iam_policy_document.vts.json}"
}

resource "aws_iam_policy_attachment" "vts" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "lambda"
  )}"

  roles      = ["${module.lambda_vts.role_name}"]
  policy_arn = "${aws_iam_policy.vts.arn}"
}
