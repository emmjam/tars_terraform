output "lb_target_group_epdq" {
  value = aws_lb_target_group.mock-epdq-8080.id
}

output "sg_mock" {
  value = aws_security_group.mock.id
}


