data "aws_iam_policy_document" "tss_cw_users" {
	  statement {
	    sid    = "CloudwatchReadOnly"
	    effect = "Allow"
	
	    actions = [
	      "autoscaling:Describe*",
	      "cloudwatch:Describe*",
	      "cloudwatch:Get*",
	      "cloudwatch:List*",
	      "logs:Get*",
	      "logs:Describe*",
	      "sns:Get*",
	      "sns:List*",
	    ]
	
	    resources = [
	      "*",
	    ]
	  }
	}
