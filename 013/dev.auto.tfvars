# Auto Fill parameters for DEV

#File can be names as:
# terraform.tfvars
# prod.auto.tfvars
# dev.auto.tfvars

region        = "ca-central-1"
instance_type = "t3.micro"

common_tag = {
  Owner       = "Vasil Terehow"
  Project     = "Gaga"
  Environment = "Dev"
}
