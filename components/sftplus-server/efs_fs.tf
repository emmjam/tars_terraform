resource "aws_efs_file_system" "sftpplus" {
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "efs"
      ),
      "Component", var.component
    )
  )}"
}

output "sftpplus_efs_id" {
  value = "${aws_efs_file_system.sftpplus.id}"
}
