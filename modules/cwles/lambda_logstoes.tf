# The core lambda function for shipping Cloudwatch Logs to the AWS Elasticsearch Domain
resource "aws_lambda_function" "logstoes" {
  filename = "${path.module}/files/cwles-logstoes.zip"

  function_name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "logstoes"
  )}"

  role        = "${aws_iam_role.lambda_logstoes.arn}"
  handler     = "index.handler"
  runtime     = "nodejs4.3"
  timeout     = "30"
  memory_size = "128"

  environment {
    variables = {
      ENDPOINT = "${aws_elasticsearch_domain.es.endpoint}"
    }
  }

  /* Available after terraform upgrade
  tags {
    "Name" = "${format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      "cwles",
      "logstoes"
    )}"

    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
    "Component"   = "${var.component}"
    "Module"      = "cwles"
  }
  */
}
