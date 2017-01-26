# security group - ec2 instance ------------------------------------------------

resource "aws_security_group" "webapp" {
  name                    = "${var.env}.${var.name}"
  description             = "The ${var.env} env ${var.name} Security Group"
  vpc_id                  = "${lookup(var.vpcs, var.region)}"
  tags {
    env                   = "${var.env}"
  }
}

# -- ingress

resource "aws_security_group_rule" "webapp_ingress" {
  count                  = "${length(var.ingress_ports_from)}"
  type                   = "ingress"
  from_port              = "${lookup(var.ingress_ports_from, count.index)}"
  to_port                = "${lookup(var.ingress_ports_to, count.index)}"
  protocol               = "${lookup(var.ingress_ports_type, count.index)}"
  cidr_blocks            = "${split(",", lookup(var.ingress_cidrs, count.index))}"
  security_group_id      = "${aws_security_group.webapp.id}"
}

# -- egress

resource "aws_security_group_rule" "webapp_egress" {
  count                  = "${length(var.egress_ports_from)}"
  type                   = "egress"
  from_port              = "${lookup(var.egress_ports_from, count.index)}"
  to_port                = "${lookup(var.egress_ports_to, count.index)}"
  protocol               = "${lookup(var.egress_ports_type, count.index)}"
  cidr_blocks            = "${split(",", lookup(var.egress_cidrs, count.index))}"
  security_group_id      = "${aws_security_group.webapp.id}"
}
