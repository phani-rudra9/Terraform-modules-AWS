resource "aws_ecs_cluster" "ecs" {
  count = length(var.ecs)
  name = lookup(var.ecs[count.index],"name")
  setting {
    name = "containerInsights"
    value = var.enable_container_insights == "yes" ? "enabled" : "disabled"
  }
  tags = {
    created_by = var.created_by
    Environment = var.environment
    Terraformed = true
  }
}
