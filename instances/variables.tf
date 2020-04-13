variable "instance_count" {
    description = "The number of compute instances to create"
    type = string
    default = ""
}

variable "hostname" {
    description = "Hostname of the machines which is derived from the project name"
    type = string
    default = ""
}

variable "region" {
    description = "The region of of the VPC"
    type = string
    default = ""
}

variable "vpc_id" {
    description = "Which VPC the compute resources are deployed in."
    type = string
    default = ""
}

variable "resource_group" {
    description = "Which VPC the compute resources are deployed in."
    type = string
    default = ""
}

variable "zone" {
    description = "Which VPC Zone to use."
    type = string
    default = ""
}

variable "subnet" {
    description = "Which VPC Zone to use."
    type = string
    default = ""
}