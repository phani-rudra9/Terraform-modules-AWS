resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "taskdef" {
  count                    = length(var.aws_ecs_task_definition)
  family                   = lookup(var.aws_ecs_task_definition[count.index],"family")
  container_definitions    = file("./modules/task-def/task-definitions/task.json")
  requires_compatibilities = ["FARGATE"] # Stating that we are using ECS Fargate
  network_mode             = "awsvpc"     # Using awsvpc as our network mode as this is required for Fargate
  memory                   = lookup(var.aws_ecs_task_definition[count.index],"memory")        
  cpu                      = lookup(var.aws_ecs_task_definition[count.index],"cpu")  
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}