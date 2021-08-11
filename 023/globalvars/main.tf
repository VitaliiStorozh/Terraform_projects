#----------------------------------------------------------
# My Terraform
#
# Global Variables in Remote State on S3
#
# Made by Vitalii Storozh
#----------------------------------------------------------
provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "storozh-vitalii-terraform-state"
    key    = "globalvars/terraform.tfstate"
    region = "us-east-2"
  }
}

#==================================================

output "company_name" {
  value = "SoftServe"
}

output "owner" {
  value = "Vitalii Storozh"
}

output "tags" {
  value = {
    Project    = "Python-2021"
    CostCenter = "R&D"
    Country    = "Ukraine"
  }
}
