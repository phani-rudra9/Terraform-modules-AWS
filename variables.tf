variable "region" {
    type = string
}

variable "vpc" {
    type = list
}

variable "environment" {
    type = string
}

variable "public_subnets" {
    type = list
}

variable "private_subnets" {
    type = list
}

variable "igw_name" {
    type = string
}

variable "public_subnet_route_tables" {
    type = list
}

variable "private_subnet_route_tables" {
    type = list
}
