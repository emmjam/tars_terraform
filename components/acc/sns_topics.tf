resource "aws_sns_topic" "acm" {
  count        = var.public_domain_name == "" ? "0" : "1"
  name         = "${local.csi}-acm"
  display_name = "ACM notifications for ${var.public_domain_name} domain"
}

resource "aws_sns_topic" "notify_ops" {
  name         = "${local.csi}-notify-ops"
  display_name = "Notify OpsTeam"

  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ${var.ops_team_email}"
  }
}

