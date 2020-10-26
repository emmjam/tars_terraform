resource "aws_iam_policy" "packer_systems_manager" {
  name        = "${local.csi}-packer-systems-manager"
  description = "IAM policy for ${local.csi}-packer-systems-manager"
  policy      = data.aws_iam_policy_document.packer_systems_manager.json
}

