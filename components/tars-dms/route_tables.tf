resource "aws_route_table" "test_rds" {
  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/test-rds"
    )
  )}"
}
