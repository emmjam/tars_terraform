resource "aws_dynamodb_table" "release_data" {

  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "release_data"
  )

    hash_key         = "pk"
    range_key        = "date_time"
    billing_mode     = "PAY_PER_REQUEST"
    stream_enabled   = false

    attribute {
      name = "pk"
      type = "S"
    }

    attribute {
      name = "date_time"
      type = "S"
    }

    attribute {
      name = "release_version"
      type = "S"
    }

    global_secondary_index {
    name               = "release_history"
    hash_key           = "release_version"
    range_key          = "date_time"
    projection_type    = "KEYS_ONLY"
  }

    tags = merge(
      var.default_tags,
      map(
        "Name", format(
          "%s-%s-%s-%s",
          var.project,
          var.environment,
          var.component,
          "release_data"
        ),
      )
    )

}