# Output all the things needed by the other components
output "sftpplus_svr-cpc-lb_sg_id" {
  value = "${aws_security_group.sftpplus_svr-cpc-lb.id}"
}
