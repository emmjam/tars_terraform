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


data "aws_iam_policy_document" "mock-lifecycle" {
  statement {
    sid = "AllowLifecycleHookLaunchingCompletion"
    effect = "Allow"
    actions = [ 
      "autoscaling:CompleteLifecycleAction"
      ]
    resources = [
      aws_autoscaling_group.tars-mock.arn,
    ]
  }
  statement {
    sid = "AllowAutoscalingDescribe"
    effect = "Allow"
    actions = [
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLifecycleHooks"
    ]
    resources = [
      "*"
    ]
  }
  }

resource "aws_iam_policy" "mock-lifecycle" {
  name   = "${local.csi}-lifecycle"
  path   = "/"
  policy = data.aws_iam_policy_document.mock-lifecycle.json
}

resource "aws_iam_role_policy_attachment" "mock-lifecycle" {  
  policy_arn = aws_iam_policy.mock-lifecycle.arn
  role       = data.terraform_remote_state.base.outputs.tars_core_iam_instance_profile_name
}