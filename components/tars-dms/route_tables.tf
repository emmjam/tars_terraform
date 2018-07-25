resource "aws_route_table" "test_rds" {
  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  # Apply default tags, and merge with additional tags
  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "test-rds"
      ),
      "Component", var.component
    )
  )}"
}
