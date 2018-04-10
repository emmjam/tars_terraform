resource "aws_security_group" "bastion_elb" {
  name        = "${var.project}-${var.environment}-${var.component}-bastion-elb"
  description = "SG for Bastion ELB"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "bastion-elb"
      ),
    )
  )}"
}

resource "aws_security_group" "bastion" {
  name        = "${var.project}-${var.environment}-${var.component}-bastion"
  description = "SG for the ctrl Bastion server"
  vpc_id      = "${aws_vpc.ctrl.id}"

  tags = "${merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s",
        var.project,
        var.environment,
        var.component,
        "bastion"
      ),
    )
  )}"
}