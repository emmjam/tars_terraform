resource "aws_dynamodb_table" "vehicle_test" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vehicle-test"
  )}"

  read_capacity  = 1    # TODO: expose
  write_capacity = 1    # TODO: expose
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "vehicle-test" 
      ),
      "Module", var.module
    )
  )}"
}
