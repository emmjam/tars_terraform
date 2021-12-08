resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.mgmt.id

  service_name = data.aws_vpc_endpoint_service.s3.service_name

  route_table_ids = concat(
    tolist([aws_route_table.public.id]),
    aws_route_table.private_nat.*.id
  )
}

