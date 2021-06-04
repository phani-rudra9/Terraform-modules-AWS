variable "public_security_groups" {
  type = list
}

variable "environment" {
  type = string
}

variable "public_security_group_rules" {
  type = list
}

variable "vpc_id" {
  type = string
}

variable "public_sg_src" {
  type = string
}