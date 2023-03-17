
data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  depends_on = [
    google_container_cluster.app_gke
  ]
  name     = "app-gke-cluster"
  location = "asia-southeast1-c"
}

provider "kubernetes" {
  

  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth.0.cluster_ca_certificate,
  )
}

resource "google_compute_address" "static_ip" {
  name = "static-ip-address"
  region = "asia-southeast1"
  project = "just-camera-375607"
}