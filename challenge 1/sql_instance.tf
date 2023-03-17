

resource "google_sql_database_instance" "sql_db" {
  depends_on = [
    google_compute_network.sql_vpc
  ]
  provider = google.db
  name = "sqldb"
  database_version = "MYSQL_5_7"
  region       = "asia-south1"
  settings {
    tier = "db-f1-micro"

     ip_configuration {
                ipv4_enabled = true
                require_ssl  = false
                
                authorized_networks {
                    name  = "appSQLconnect"
                    value = var.static_ip_app
                    
         }
      }
   }
}


resource "google_sql_database" "database" {
  provider = google.db
  
  name      = "appdb"
  instance  = google_sql_database_instance.sql_db.name
}

resource "google_sql_user" "users" {
  provider = google.db
  name     = "root"
  instance = google_sql_database_instance.sql_db.name
  password = "sql-app@&A#"
}