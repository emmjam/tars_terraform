resource "aws_lambda_function" "logstoes" {
  filename = "${path.module}/files/cwles-logstoes.zip"

  function_name = "${local.csi}-cwles-logstoes"

  role        = "${aws_iam_role.lambda_logstoes.arn}"
  handler     = "index.handler"
  runtime     = "nodejs8.10"
  timeout     = "30"
  memory_size = "128"

  environment {
    variables = {
      ENDPOINT = "${data.terraform_remote_state.acc.cwles_es_domain_endpoint}"
    }
  }
}
