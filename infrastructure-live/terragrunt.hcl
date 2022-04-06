locals {
  common_vars = yamldecode(file("common_vars.yaml"))
  environment = split("/", path_relative_to_include())[0]
}

inputs = {
  service     = local.common_vars.service
  environment = local.environment
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.19.0"
    }
  }
}

provider "digitalocean" {

}
EOF
}
