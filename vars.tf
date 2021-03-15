variable "region" {
  type    = string
  default = "us-east-1"
}

variable "base-zone" {
  type    = string
  default = "kwiniaskaridge"
}

variable "tlds" {
  type    = list(string)
  default = ["org", "com", "net"]
}
