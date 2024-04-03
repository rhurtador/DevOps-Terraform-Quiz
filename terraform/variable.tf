variable "EnvironmentName" {
  description = "An environment name that will be prefixed to resource names"
  type        = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
}