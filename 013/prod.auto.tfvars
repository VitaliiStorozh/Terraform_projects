# Auto Fill parameters for DEV

#File can be names as:
# terraform.tfvars
# prod.auto.tfvars
# dev.auto.tfvars

region        = "us-east-2"
instance_type = "t2.micro"

common_tag = {
  Owner       = "SoftServe"
  Project     = "Study"
  Environment = "Prod"
}
