module "lambda_atf_account_view" {
  source = "../lambda"

  name        = "atf-account-view"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  s3_bucket = "${aws_s3_bucket.main.bucket}"
  s3_key    = "packages/${var.atf_account_view_s3_key}"

  runtime     = "nodejs6.10"
  handler     = "lambda.handler"
  memory_size = "${var.atf_account_view_memory_size}"
  timeout     = "${var.atf_account_view_timeout}"
  publish     = "${var.atf_account_view_publish}"

  principal_service = "apigateway"

  invoker_source_arn = "${format(
    "%s:%s:%s:%s/%s",
    "arn:aws:execute-api",
    var.aws_region,
    data.aws_caller_identity.current.account_id,
    aws_api_gateway_rest_api.atf_account_view.id,
    "*/*/*"
  )}"

  env_variables = "${merge(
    var.atf_account_view_env_vars,
    map(
      "URLROOT", var.public_domain_name == "" ? "/${var.environment}/" : "/",
      "ASSETS", var.public_domain_name == "" ? format("%s%s.%s.%s.%s/%s/%s",
        "https://",
        aws_api_gateway_rest_api.atf_account_view.id,
        "execute-api",
        var.aws_region,
        "amazonaws.com",
        var.environment,
        "assets/"
      ) : "https://${aws_route53_record.main.fqdn}/assets/",
      "APPSECRET", "${sha256("${timestamp()}${var.atf_account_view_app_secret}")}"
    )
  )}"

  cwlg_retention_in_days = "${var.atf_account_view_cwlg_retention_in_days}"

  default_tags = "${var.default_tags}"
}
