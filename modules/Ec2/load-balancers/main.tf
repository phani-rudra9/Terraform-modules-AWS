resource "aws_lb" "phani" {
  count              = length(var.lbs)
  name               = lookup(var.lbs[count.index],"name")
  internal           = lookup(var.lbs[count.index],"lb_scheme_internal")
  load_balancer_type = lookup(var.lbs[count.index],"lb_type")
  security_groups    = [var.security_group_id]
  subnets            = [var.subnets]
  enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
	Name = format("${var.environment}-%s", lookup(var.lbs[count.index], "name"))
	Environment = var.environment
	Terraformed = "True"
	}
}