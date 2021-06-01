provider "aws" {
  region = "us-east-2"
}

module "webserver_custer" {
  source = "../../../modules/services/weserver_cluster"
  
  cluster_name = "webservers-stage"
  db_remote_state_bucket = "terraform-up-and-running-state-9933"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2

} 