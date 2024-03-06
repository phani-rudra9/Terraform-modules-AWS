resource "aws_lb_target_group" "tg" {
  count       = length(var.tg)
  name        = format("${var.environment}-%s", lookup(var.tg[count.index],"tg_name"))
  port        = lookup(var.tg[count.index],"port")
  protocol    = lookup(var.tg[count.index],"protocol")
  target_type = lookup(var.tg[count.index],"target_type")
  vpc_id      = var.vpc_id
  health_check {
      healthy_threshold = "2"
      interval  = "30"
      timeout = "5"
      unhealthy_threshold = "3"
      path = lookup(var.tg[count.index],"health_check_path")
  }
  deregistration_delay = lookup(var.tg[count.index],"deregistration_delay")
  load_balancing_algorithm_type = lookup(var.tg[count.index],"load_balancing_algorithm_type")
  tags = {
	Name = format("${var.environment}-%s", lookup(var.tg[count.index], "name"))
	Environment = var.environment
	Terraformed = "True"
	}
}

resource "aws_lb_target_group_attachment" "tg_attach" {
  count = length(var.tg)
  target_group_arn = element(aws_lb_target_group.tg.*.arn,count.index)
  # target_id        = var.tg_ids
  # target_id        = element(split(",", join(",", private_instances.*.id)), count.index)
  target_id          = tolist(var.private_instances, count.index)

}
