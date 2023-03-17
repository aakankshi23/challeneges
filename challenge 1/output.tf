
output "app_vpc_id" {
  value = google_compute_network.app_vpc.id
}

output "sql_vpc_id" {
  value = google_compute_network.sql_vpc.id
}

output "uname" {
    value = google_sql_user.users.name
}

output "pass" {
    sensitive = true
    value = google_sql_user.users.password
}

output "pubip" {
    value = google_sql_database_instance.sql_db.public_ip_address
}

output "dbname" {
    value = google_sql_database.database.name
}

output "static_ip_wp" {
  value = google_compute_address.static_ip.address
}