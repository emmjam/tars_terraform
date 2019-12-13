# A Lambda function to curate old indices in the Elasticsearch Domain
resource "aws_lambda_function" "curator" {
  filename = "${path.module}/files/awses-curator.zip"

  function_name = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "curator",
  )

  role        = aws_iam_role.lambda_curator.arn
  handler     = "index.handler"
  runtime     = "nodejs4.3"
  timeout     = "300"
  memory_size = "128"

  environment {
    variables = {
      ENDPOINT         = aws_elasticsearch_domain.es.endpoint
      MAX_INDEX_AGE    = var.curator_max_age
      EXCLUDED_INDICES = var.curator_excluded_indices
      ES_REGION        = data.aws_region.current.name
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
      "curator"
    )}"

    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
    "Component"   = "${var.component}"
    "Module"      = "cwles"
  }
  */
}

