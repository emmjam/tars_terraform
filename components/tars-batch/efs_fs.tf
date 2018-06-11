resource "aws_efs_file_system" "batch" {
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "batch"
      ),
      "Component", var.component
    )
  )}"
}

output "batch_efs_id" {
  value = "${aws_efs_file_system.batch.id}"
}
