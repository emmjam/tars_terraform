resource "aws_vpc_endpoint" "s3" {
  vpc_id = "${aws_vpc.ctrl.id}"

  service_name = "${format(
    "%s.%s.%s",
    "com.amazonaws",
    var.aws_region,
    "s3"
  )}"

  route_table_ids = [
    "${aws_route_table.public.id}",
    "${aws_route_table.private_nat.*.id}",
  ]
}
