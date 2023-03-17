

resource "google_compute_network" "sql_vpc" {
  name                    = "sql-vpc"
  provider = google.db
  auto_create_subnetworks = false
  project = "developer-project-380708"
}


resource "google_compute_subnetwork" "db_subnet1" {
     provider = google.db
  name          = "subnet1"
  project       = "developer-project-380708"
  ip_cidr_range = "10.0.1.0/24"
  region        = "asia-south1"
  network       = google_compute_network.sql_vpc.id
  private_ip_google_access = true
}

resource "google_compute_network_peering" "peering2" {
  depends_on =[
    google_compute_network.sql_vpc
  ]
  provider = google.db
  name         = "peering2"
  network      = google_compute_network.sql_vpc.id
  peer_network = google_compute_network.app_vpc.id
}


