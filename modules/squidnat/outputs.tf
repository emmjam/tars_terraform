################################################################################
#
# Squid NAT Outputs
#
################################################################################

# Security group ID
output "security_group_id" {
  value = "${aws_security_group.squidnat.id}"
}

# Node IDs
output "instance_ids" {
  value = [
    "${aws_instance.squidnat.*.id}",
  ]
}

output "private_ips" {
  value = [
    "${aws_instance.squidnat.*.private_ip}",
  ]
}

output "public_ips" {
  value = [
    "${aws_instance.squidnat.*.public_ip}",
  ]
}

# Using the instance output rather than the subnet-tuple module output
# to help ensure the output lists maintain a relationship with each other
output "subnet_ids" {
  value = [
    "${aws_instance.squidnat.*.subnet_id}",
  ]
}

output "availability_zones" {
  value = [
    "${aws_instance.squidnat.*.availability_zone}",
  ]
}
