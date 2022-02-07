# Output all the things needed by the other components

output "sftpplus_efs_id" {
  value = aws_efs_file_system.sftpplus.id
}