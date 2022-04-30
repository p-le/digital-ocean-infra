resource "random_id" "cvat_droplet" {
  byte_length = 4
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    user_data    = file("${path.module}/user_data.sh")
    droplet_size = var.droplet_size
  }
}

resource "digitalocean_project" "cvat" {
  name        = var.service
  environment = var.environment
  description = "Project for CVAT deployment"
  purpose     = "Web Application"
}

resource "digitalocean_droplet" "cvat" {
  name      = "${var.service}-${random_id.cvat_droplet.hex}"
  size      = random_id.cvat_droplet.keepers.droplet_size
  image     = var.droplet_image
  region    = var.droplet_region
  user_data = random_id.cvat_droplet.keepers.user_data
}

resource "digitalocean_domain" "cvat" {
  name       = "cvat.${var.domain}"
  ip_address = digitalocean_droplet.cvat.ipv4_address
}

resource "digitalocean_project_resources" "cvat_droplet" {
  project = digitalocean_project.cvat.id
  resources = [
    digitalocean_droplet.cvat.urn,
    digitalocean_domain.cvat.urn
  ]
}
