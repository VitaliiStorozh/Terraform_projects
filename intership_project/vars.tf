variable "region" {
  default = "eu-central-1"
}

variable "name" {
  default = "Mingle"
}

variable "db_settings" {
  default = {
    db_user     = "mingle"
    db_password = "superpassw0rd"
  }
  sensitive = true
}
