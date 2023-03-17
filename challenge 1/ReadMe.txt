#A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources on a cloud environment (GCP Cloud). 


This folder conatins terraform script for creation of 3-tier architecture in GCP as follows-

- Creates 2 projects in different two different regions.
- Creates SQL Server in 1 VPC in 1 project.
- Creates the Google Kubernetes Cluster in another VPC in second project.
- Deploys a WordPress deployment in GKE cluster. 
- Deploys a WordPress service with the type LoadBalancer which gives an external IP for accessing the WordPress site.
- Connects WordPress site to the created SQL database.

Steps for creation-

Terraform init - To initiale the plugins and providers
Terraform validate - To validate the configuration
Terraform plan - Outputs a plan of architecture before creation
Terraform apply - Applies/Creates the architecture in GCP account
