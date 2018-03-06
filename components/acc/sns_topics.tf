resource "aws_sns_topic" "acm" {
  count = "${var.public_domain_name == "" ? "0" : "1" }"

  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "acm"
  )}"

  display_name = "ACM notifications for ${var.public_domain_name} domain"
}

resource "aws_sns_topic" "notify_ops" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "notify-ops"
  )}"

  display_name = "Notify OpsTeam"

  # provisioner "local-exec" {
  #   command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ${var.???}"
  # }
}
