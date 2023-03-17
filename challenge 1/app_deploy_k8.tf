resource "kubernetes_deployment" "app_deploy" {
  metadata {
    name = "wordpress"
    labels = {
      app = "wordpress"
    }
  }
  spec {
      replicas = 1
    selector {
      match_labels = {
        app = "wordpress"
      }
    }
    template {
      metadata {
        labels = {
          app = "wordpress"
        }
      }
      spec {
        container {
          image = "wordpress"
          name  = "wordpress-pod"
          env {
            name = "WORDPRESS_DB_HOST"
            value = var.pubip
            }
          env {
            name = "WORDPRESS_DB_DATABASE"
            value = var.dbname
            }
          env {
            name = "WORDPRESS_DB_USER"
            value = var.uname
            }
          env {
            name = "WORDPRESS_DB_PASSWORD"
            value = var.pass
          }
          port {
        container_port = 80
          }
        }
      }
    }
  }
}