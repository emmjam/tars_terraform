# Example SES Domain Identity
resource "aws_ses_domain_identity" "tars" {
  domain = "${var.public_domain_name}"
}


resource "aws_route53_record" "amazonses_verification_record" {
  zone_id = "${data.aws_route53_zone.public.id}"
  name    = "_amazonses"
  type    = "TXT"
  ttl     = "3600"
  records = ["${aws_ses_domain_identity.tars.verification_token}"]
}


########### SES MAil from and associated TXT record fo SPF 

resource "aws_ses_domain_mail_from" "tars" {
  domain           = "${aws_ses_domain_identity.tars.domain}"
  mail_from_domain = "mail.${aws_ses_domain_identity.tars.domain}"
}


# Example Route53 TXT record for SPF
resource "aws_route53_record" "ses_domain_mail_from_txt" {
  zone_id = "${data.aws_route53_zone.public.id}"
  name    = "${aws_ses_domain_mail_from.tars.mail_from_domain}"
  type    = "TXT"
  ttl     = "600"
  records = ["v=spf1 include:amazonses.com -all"]
}


resource "aws_route53_record" "ses_domain_mail_from_mx" {
  zone_id = "${data.aws_route53_zone.public.id}"
  name    = "${aws_ses_domain_mail_from.tars.mail_from_domain}"
  type    = "MX"
  ttl     = "600"
  records = ["10 feedback-smtp.eu-west-1.amazonses.com"] # Change to the region in which `aws_ses_domain_identity.example` is created
}

########## Add the DKIM records to R53


resource "aws_ses_domain_dkim" "tars" {
  domain = "${aws_ses_domain_identity.tars.domain}"
}


resource "aws_route53_record" "amazonses_dkim_record" {
  count   = "3"
  zone_id = "${data.aws_route53_zone.public.id}"
  name    = "${element(aws_ses_domain_dkim.tars.dkim_tokens, count.index)}"
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.tars.dkim_tokens, count.index)}.dkim.amazonses.com"]
}

### Create the IAM user with permission to Send Raw Email

resource "aws_iam_user" "ses_user" {
  name = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "ses"
  )}"
  path = "/"
}

resource "aws_iam_access_key" "ses_user" {
  user = "${aws_iam_user.ses_user.name}"
}

resource "aws_iam_user_policy" "ses_allow_send" {
  name = "${format(
    "%s-%s-%s-%s-",
    var.project,
    var.environment,
    var.component,
    "ses"
  )}"
  user = "${aws_iam_user.ses_user.name}"
  policy = "${data.aws_iam_policy_document.ses_user.json}"
}




data "aws_iam_policy_document" "ses_user" {
  statement {
    effect = "Allow"
    actions = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}
