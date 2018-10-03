# S3
data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id = "${aws_vpc.mgmt.id}"

  service_name = "${data.aws_vpc_endpoint_service.s3.service_name}"

  route_table_ids = [
    "${aws_route_table.public.id}",
    "${aws_route_table.private_nat.*.id}",
  ]
}

# DynamoDB
data "aws_vpc_endpoint_service" "dynamodb" {
  service = "dynamodb"
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id = "${aws_vpc.mgmt.id}"

  service_name = "${data.aws_vpc_endpoint_service.dynamodb.service_name}"

  route_table_ids = [
    "${aws_route_table.public.id}",
    "${aws_route_table.private_nat.*.id}",
  ]
}
