provider "aws" {
  region = "us-east-2"
}

module "webserver_custer" {
  source = "../../../modules/services/weserver_cluster"
} 