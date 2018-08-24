resource "aws_efs_file_system" "cpc-batch-efs" {
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "cpc-batch-efs"
      ),
      "Component", var.component
    )
  )}"
}

output "cpc-batch_efs_id" {
  value = "${aws_efs_file_system.cpc-batch-efs.id}"
}
