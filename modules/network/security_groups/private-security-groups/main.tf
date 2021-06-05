
resource "aws_security_group" "private_sg" {
  count = length(var.private_security_groups)
  description = lookup(var.private_security_groups[count.index],"description")
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
	Name = format("${var.environment}-%s", lookup(var.private_security_groups[count.index], "name"))
	Environment = var.environment
	Terraformed = "True"
	}
}

resource "aws_security_group_rule" "private_sg_rule" {
  count = length(var.private_security_group_rules)
  type              = "ingress"
  from_port         = lookup(var.private_security_group_rules[count.index],"from_port")
  to_port           = lookup(var.private_security_group_rules[count.index],"to_port")
  protocol          = lookup(var.private_security_group_rules[count.index],"protocol")
  source_security_group_id = var.public_sg_src
  security_group_id = aws_security_group.private_sg.*.id[count.index % length(var.private_security_groups)]
}