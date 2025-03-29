variable "instance_type" {
  default = "t3.xlarge"
  type    = string
}

variable "sg_name" {
  type    = string
  default = "AllowAllMyIP"
}
