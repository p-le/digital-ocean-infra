include "root" {
  path = find_in_parent_folders()
}

inputs = {
  domain         = "phu-le.dev"
  droplet_region = "sgp1"
  droplet_image  = "ubuntu-20-04-x64"
  droplet_size   = "s-2vcpu-2gb"
}
