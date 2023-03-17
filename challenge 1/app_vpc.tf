

resource "google_compute_network" "app_vpc" {
  name                    = "app-vpc"
  auto_create_subnetworks = false
  project                 = "just-camera-375607"
}



resource "google_compute_subnetwork" "app_subnet1" {
  name          = "subnet1"
  project       = "just-camera-375607"
  ip_cidr_range = "192.168.1.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.app_vpc.id
  private_ip_google_access = true
}

resource "google_compute_network_peering" "peering1" {
  depends_on = [
    google_compute_network.app_vpc
  ]
  name         = "peering1"
  network      = google_compute_network.app_vpc.id
  peer_network = google_compute_network.sql_vpc.id
}