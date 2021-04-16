output "lb_target_group_epdq_private" {
  value = aws_lb_target_group.mock-epdq-8080-private.id
}

output "lb_target_group_epdq-public" {
  value = aws_lb_target_group.mock-epdq-8080-public.id
}

output "lb_target_group_epdq-db" {
  value = aws_lb_target_group.epdq-db.id
}

output "lb_target_group_gov_gateway_private" {
  value = aws_lb_target_group.mock_gov_gateway_9090_private.id
}

output "lb_target_group_gov_gateway_public" {
  value = aws_lb_target_group.mock_gov_gateway_9090_public.id
}

output "sg_epdq" {
  value = aws_security_group.epdq.id
}

output "sg_gov_gateway" {
  value = aws_security_group.gov_gateway.id
}
