# resource "aws_lb_listener" "phani" {
#   count = length(var.lb_listener)
#   load_balancer_arn = var.alb_arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = var.tg_arn
#   }
# }