variable "region" {
    type = string 
    default = ""
}

variable "environment" {
    type = string
    default = ""
}

variable "vpc" {
    type = list
    default =[] 
    }

variable "public_subnets" {
    type = list
    default = []
}

variable "igw" {
    type = list
    default = []
}
variable "ecr-repo" {
    type = list
    default = []  
}

variable "created_by" {
    type = string
    default = "vara-prasad"
  
}

variable "aws_ecs_task_definition" {
    type = list
    default=[]
}

variable "ecs" {
    type = list
    default = []
}

variable "enable_container_insights" {
  type = string
  default = "yes"
}