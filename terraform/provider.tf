#----------------------------------------------------
#                   PROVIDERS
#----------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.70.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region

  default_tags {
    tags = {
      devops = "labs-server"
    }
  }
}
