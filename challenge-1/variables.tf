variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "az" {
  type        = string
  description = "The AZ to deploy to"
  default     = "eu-west-2a"
}

variable "public_subnet" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "private_subnet" {
  type        = string
  description = "CIDR block for the private subnet"
}

variable "data_subnet" {
  type        = string
  description = "CIDR block for the data subnet"
}

variable "service" {
  type        = string
  description = "Name of the service to deploy"
}

variable "ami_id" {
  type        = string
  description = "AMI ID of the image to use"
  default     = "ami-03e88be9ecff64781"
}
