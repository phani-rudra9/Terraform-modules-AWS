variable "security_group_id" {
  type = string
}

variable "lbs" {
  type = list
}

variable "subnets" {
  type = list(string)
}

variable "environment" {
  type = string 
}
