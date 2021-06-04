provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "my_Ubuntu" {
  count         = 1
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t3.micro"

  tags = {
    Name    = "My Ubuntu Server"
    Owner   = "Vitalii_Storozh"
    Project = "Terraform Praktice"
  }
}

resource "aws_instance" "my_Amazon_Linux" {
  ami           = "ami-043097594a7df80ec"
  instance_type = "t3.small"

  tags = {
    Name    = "My Amazon Server"
    Owner   = "Vitalii_Storozh"
    Project = "Terraform Praktice"
  }
}
