resource "digitalocean_vpc" "main" {
  name     = "${var.service}-${var.environment}-vpc"
  region   = var.region
  ip_range = "10.0.1.0/24"
}

output "vpc_id" {
  value = digitalocean_vpc.main.id
}
