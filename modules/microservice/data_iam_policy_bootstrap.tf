data "aws_iam_policy_document" "bootstrap" {
  statement {
    sid    = "AllowLifecycleHookLaunchingCompletion"
    effect = "Allow"

    actions = [
      "autoscaling:CompleteLifecycleAction",
    ]

    resources = [
      "${aws_autoscaling_group.main.arn}",
    ]
  }

  # These API actions do not support resource or condition limitations
  # We could just throw them in with the first statement,
  # but we're not animals.
  statement {
    sid    = "AllowAutoscalingDescribe"
    effect = "Allow"

    actions = [
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLifecycleHooks",
    ]

    resources = [
      "*",
    ]
  }
}
