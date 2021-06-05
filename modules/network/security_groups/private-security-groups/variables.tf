
variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_security_groups" {
  type = list
}

variable "private_security_group_rules" {
  type = list
}

variable "public_sg_src" {
  type = string 
}