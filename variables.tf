variable "project_name" {
    type = string
    default = "python"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "common_tags" {
    default = {
        project_name = "python"
        terraform = "true"
        environment = "dev"
    }
}

variable "enable_dns_hostnames" {
    type = bool
    default = true
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "igw_tags" {
    default = {}
}

variable "public_subnet_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "public_subnet_tags" {
    default  = {}
    
}

variable "az_names" {
    default = "us-east-1a"
}

variable "public_route_table_tags" {
    default = {}
}

variable "sg_tags" {
    default = {}

}

variable "sg_name" {
    default = "mysql"
}

variable "vpc_tags" {
    default = {}
}