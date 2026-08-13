variable "VPC_NAME" {
  default = "terraform-vpc"
}
variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}
variable "Zone1" {
  default = "ap-south-1a"
}
variable "Zone2" {
  default = "ap-south-1b"
}
variable "Zone3" {
  default = "ap-south-1c"
}
variable "PRIVATE_SUBNET_1" {
  default = "10.0.1.0/24"
}
variable "PRIVATE_SUBNET_2" {
  default = "10.0.2.0/24"
}
variable "PRIVATE_SUBNET_3" {
  default = "10.0.3.0/24"
}
variable "PUBLIC_SUBNET_1" {
  default = "10.0.101.0/24"
}
variable "PUBLIC_SUBNET_2" {
  default = "10.0.102.0/24"
}
variable "PUBLIC_SUBNET_3" {
  default = "10.0.103.0/24"
}
