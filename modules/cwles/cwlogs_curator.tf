# The Cloudwatch Logs Log Group for logging output from the Curator Lambda function
resource "aws_cloudwatch_log_group" "lambda_curator" {
  name              = "/aws/lambda/${aws_lambda_function.curator.function_name}"
  retention_in_days = "90"

  tags = {
    "Name" = "${format(
      "%s-%s-%s/%s/%s/%s",
      var.project,
      var.environment,
      var.component,
      "lambda",
      "cwles",
      "curator"
    )}"

    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
    "Component"   = "${var.component}"
    "Module"      = "cwles"
  }
}
