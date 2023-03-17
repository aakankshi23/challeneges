resource "kubernetes_service" "app_service" {
  metadata {
    name = "app-service"
   
  }
  spec {
    load_balancer_ip = google_compute_address.static_ip.address
    selector = {
      app = "wordpress"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  
  }
}