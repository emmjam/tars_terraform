################################################################################
#
# Squid NAT Outputs
#
################################################################################

# Security group ID
output "security_group_id" {
  value = aws_security_group.squidnat.id
}

# Node IDs
output "autoscaling_group_ids" {
  value = [
    module.microservice_squidnat_0.autoscaling_group_id,
    module.microservice_squidnat_1.autoscaling_group_id,
    module.microservice_squidnat_2.autoscaling_group_id,
  ]
}

output "squidnat_interface_ids" {
  value = aws_network_interface.squid.*.id
}

# Using the instance output rather than the subnet-tuple module output
# to help ensure the output lists maintain a relationship with each other
output "subnet_ids" {
  value = [
    module.microservice_squidnat_0.subnet_ids,
  ]
}

