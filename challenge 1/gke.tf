data "google_project" "project" {}


resource "google_container_cluster" "app_gke" {
  depends_on = [
    google_compute_network.app_vpc
  ]
  name     = "app-gke-cluster"
  location = "asia-southeast1-c"
  initial_node_count       = 1
  remove_default_node_pool = true
  network = google_compute_network.app_vpc.name
  subnetwork = google_compute_subnetwork.app_subnet1.id
} 

resource "google_container_node_pool" "app_cluster_nodes" {
  name       = "app-node-pool"
  location   = "asia-southeast1-c"
  cluster    = google_container_cluster.app_gke.name
  node_count = 1

  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 10
    disk_type = "pd-standard"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
