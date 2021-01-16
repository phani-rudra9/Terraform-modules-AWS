module "vpc" {
    source = "./modules/network/vpc"
    vpc = var.vpc
    environment = var.environment  
}

module "public_subnets" {
    source = "./modules/network/subnets/public-subnets"
    vpc_id = module.vpc.vpc_id[1]
    public_subnets = var.public_subnets
    environment = var.environment    
}


module "igw" {
    igw = var.igw
    source = "./modules/network/igw"
    vpc_id = module.vpc.vpc_id[1]
}
module "ecrrepo" {
    source = "./modules/ecr-repo"
    ecr-repo    = var.ecr-repo
    environment = var.environment 
    created_by = var.created_by     
}

module "taskdef" {
    source = "./modules/task-def"
    aws_ecs_task_definition = var.aws_ecs_task_definition
  
}

module "ecs" {
    source = "./modules/ecs-cluster"
    ecs = var.ecs
    created_by = var.created_by
    environment = var.environment
    enable_container_insights = var.enable_container_insights
}

