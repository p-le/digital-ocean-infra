include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    vpc_id = "temporary-vpc-id"
  }
}

terraform {
  source = "./../../../modules//droplet"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}
