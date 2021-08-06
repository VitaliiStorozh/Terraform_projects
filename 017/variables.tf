variable "env" {
  default = "prod"
}

variable "prod_owner" {
  default = "Vitalii Storozh"
}

variable "noprod_owner" {
  default = "Intern Vadym"
}

variable "ec2_size" {
  default = {
    "prod"  = "t3.medium"
    "dev"   = "t3.small"
    "stage" = "t2.micro"
  }
}

variable "allow_port_list" {
  default = {
    "prod" = ["80", "443"]
    "dev"  = ["80", "443", "8080", "22"]
  }
}
