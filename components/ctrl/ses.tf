# Example SES Domain Identity
resource "aws_ses_domain_identity" "tars" {
  domain = "${var.public_domain_name}"
}

resource "aws_route53_record" "amazonses_verification_record" {
  zone_id = "${data.aws_route53_zone.public.id}"
  name    = "_amazonses"
  type    = "TXT"
  ttl     = "3600"

  records = [
    "${aws_ses_domain_identity.tars.verification_token}",
  ]
}

########### SES Mail From and associated TXT record for SPF 

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

  records = [
    "v=spf1 include:amazonses.com -all",
  ]
}


resource "aws_route53_record" "ses_domain_mail_from_mx" {
  zone_id = "${data.aws_route53_zone.public.id}"
  name    = "${aws_ses_domain_mail_from.tars.mail_from_domain}"
  type    = "MX"
  ttl     = "600"

  # TODO: peacheym: Parameterise instead
  # Change to the region in which `aws_ses_domain_identity.example` is created
  records = [
    "10 feedback-smtp.eu-west-1.amazonses.com"
  ]
}

########## Add the DKIM records to R53

resource "aws_ses_domain_dkim" "tars" {
  domain = "${aws_ses_domain_identity.tars.domain}"
}

resource "aws_route53_record" "amazonses_dkim_record" {
  count   = "3"
  zone_id = "${data.aws_route53_zone.public.id}"

  name = "${format(
    "%s._domainkey",
    element(aws_ses_domain_dkim.tars.dkim_tokens, count.index)
  )}"

  type    = "CNAME"
  ttl     = "600"

  records = [
    "${format(
      "%s.dkim.amazonses.com",
      element(aws_ses_domain_dkim.tars.dkim_tokens, count.index)
    )}"
  ]
}

### Create the IAM user with permission to Send Raw Email

# TODO: peacheym: Why does this username end with a hyphen?
#                 Presume it's a copypasta fail from a resource
#                 that uses name_prefix(?)
resource "aws_iam_user" "ses_user" {
  name = "${local.csi}-ses-"
  path = "/"
}

resource "aws_iam_access_key" "ses_user" {
  user = "${aws_iam_user.ses_user.name}"
}

# TODO: peacheym: Same issue with '-' suffix
resource "aws_iam_user_policy" "ses_allow_send" {
  name   = "${local.csi}-ses-"
  user   = "${aws_iam_user.ses_user.name}"
  policy = "${data.aws_iam_policy_document.ses_user.json}"
}

data "aws_iam_policy_document" "ses_user" {
  statement {
    effect = "Allow"

    actions = [
      "ses:SendRawEmail",
    ]

    resources = [
      "*",
    ]
  }
}
