# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  name     = "${var.service}-${var.environment}-web-1"
  region   = var.region
  vpc_uuid = var.vpc_id
  image    = var.image
  size     = var.size
}
