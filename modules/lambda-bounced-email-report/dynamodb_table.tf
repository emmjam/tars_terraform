resource "aws_dynamodb_table" "bounced_email_report" {
  count = var.enable_bounced_email_report

  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.table_name
  )

    read_capacity  = var.read_capacity
    write_capacity = var.write_capacity
    hash_key       = var.hash_key
    range_key      = var.range_key

    global_secondary_index {
        name               = "SESMessageType-index"
        hash_key           = "SESMessageType"
        range_key          = ""
        write_capacity     = 5 
        read_capacity      = 5 
        projection_type    = "ALL"
        non_key_attributes = []
    }   

    attribute {
      name = "SESMessageId"
      type = "S"
    }
  
    attribute {
      name = "SnsPublishTime"
      type = "S"
    }
  
  
    attribute {
      name = "SESMessageType"
      type = "S"
    }
  
    tags = merge(
      var.default_tags,
      map(
        "Name", format(
          "%s-%s-%s-%s",
          var.project,
          var.environment,
          var.component,
          var.name
        ),
        "Module", var.module
      )
    )

}
