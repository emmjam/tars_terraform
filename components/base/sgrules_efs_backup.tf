resource "aws_security_group_rule" "efs_backup_s3_endpoint" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  security_group_id = "${module.efs_backup.security_group_id}"
  
  prefix_list_ids   = [
    "${aws_vpc_endpoint.s3.prefix_list_id}"
  ]
}
