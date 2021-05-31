resource "aws_security_group" "public_sg" {
  count = length(var.public_security_groups)
  description = lookup(var.public_security_groups[count.index],"description")
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
	Name = format("${var.environment}-%s", lookup(var.public_security_groups[count.index], "name"))
	Environment = var.environment
	Terraformed = "True"
	}
}

resource "aws_security_group_rule" "public_sg_rule" {
  count = length(var.public_security_group_rules)
  type              = "ingress"
  from_port         = lookup(var.public_security_group_rules[count.index],"from_port")
  to_port           = lookup(var.public_security_group_rules[count.index],"to_port")
  protocol          = lookup(var.public_security_group_rules[count.index],"protocol")
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_sg.*.id[0]
}
