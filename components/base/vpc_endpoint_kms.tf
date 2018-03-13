resource "aws_vpc_endpoint" "kms" {
  vpc_id            = "${aws_vpc.vpc.id}"
  service_name      = "com.amazonaws.eu-west-1.kms"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    "${aws_security_group.kms_endpoint.id}"
  ]

  subnet_ids = [
    "${module.tars_backend_subnets.subnet_ids}"  
  ]
  private_dns_enabled = true
}