resource "aws_iam_role" "main" {
  name = local.csi_name

  assume_role_policy = data.aws_iam_policy_document.assumerole.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/${var.name}",
    ),
  )
}
