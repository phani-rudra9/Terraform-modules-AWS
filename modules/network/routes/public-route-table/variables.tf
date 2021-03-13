variable "public_subnet_route_tables" {
    type = list
}

variable "internet_gateway_id" {
    type = string 
}

variable "environment" {
    type = string
}

variable "public_subnets" {
    type = list
}

variable "vpc_id" {
    type = string
}