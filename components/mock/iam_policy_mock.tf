data "aws_iam_policy_document" "mock" {
  statement {
    sid = "MockNone"

    actions = [
      "ecs:DescribeClusters",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "mock" {
  name   = "${local.csi}-mock"
  path   = "/"
  policy = data.aws_iam_policy_document.mock.json
}
