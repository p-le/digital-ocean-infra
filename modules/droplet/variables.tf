variable "service" {
  type = string
}

variable "region" {
  type    = string
  default = "sgp1"
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "size" {
  type    = string
  default = "s-1vcpu-1gb"
}

variable "image" {
  type    = string
  default = "ubuntu-20-04-x64"
}
