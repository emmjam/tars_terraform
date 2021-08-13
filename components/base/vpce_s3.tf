resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.vpc.id

  service_name = format("%s.%s.%s", "com.amazonaws", var.aws_region, "s3")
  tags         = local.default_tags
  
  route_table_ids = concat(
    list(aws_route_table.public.id),
    aws_route_table.private_nat.*.id,
    list(aws_route_table.private_nonat.id),
    list(aws_route_table.private_natgw.id),
  )
  
}

