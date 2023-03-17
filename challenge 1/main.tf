provider "google"  {
     
  
  project = "just-camera-375607"
  region  = "asia-southeast1"
  

  credentials = file("/Users/akashverma/Downloads/prod-project-key.json")
}

provider "google"  {

 alias="db"
 
 project     = "developer-project-380708"
 region      = "asia-south1"

credentials = file("/Users/akashverma/Downloads/developer-project-380708-8ec015086fd1.json")

}