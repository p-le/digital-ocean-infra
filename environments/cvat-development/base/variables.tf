variable "service" {
  type = string
}

variable "environment" {
  type        = string
  description = "The environment of the project's resources. The possible values are: Development, Staging, Production"
  default     = "development"
}

variable "domain" {
  type        = string
  description = "The name of the domain"
}

variable "droplet_region" {
  type        = string
  description = "The region to start Droplet."
}

variable "droplet_size" {
  type        = string
  description = "The unique slug that indentifies the type of Droplet."
}

variable "droplet_image" {
  type        = string
  description = "The Droplet image ID or slug"
}
