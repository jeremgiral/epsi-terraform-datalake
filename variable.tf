variable "region" { default = "us-west-1" }
variable "amis" {
  type = "map"
  default = {
    "eu-west-1" = "ami-047bb4163c506cd98"
    "us-west-1" = "ami-0bdb828fd58c52235"

  }
}
# variable "ami_name" {}
# variable "ami_id" {}
# variable "ami_key_pair_name" {}
