#----------------------------------------------------
#                   VARIABLES
#----------------------------------------------------

variable "region" {
  description = "AWS region by default"
  default     = "us-east-1"
}

variable "resource_name" {
  description = "Name of the resources created to finding them more easily in the AWS Console"
  default     = "devops-labs-jenkins"
}

variable "av_zone" {
  description = "AWS avalability zone where will be hosted the resource"
  type        = string
  default     = "us-east-1d"
}

variable "itype" {
  description = "Instance type to be configured"
  default     = "t2.micro"
}

#-------------------NETWORKING-------------------------

variable "vpc_cidr_ipv4" {
  description = "The cidr block for the VPC"
  type        = string
  default     = "172.0.0.0/16"
}

variable "sb_pub_cidr_ipv4" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "172.0.1.0/24"
}

variable "ipv4_default" {
  description = "The CIDR default block for ipv4"
  type        = string
  default     = "0.0.0.0/0"
}

#-------------------SECURITY-------------------------

variable "ssh_key" {
  description = "Public PEM key installed in the AWS instances for SSH access"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqT1bgBw6I/94Y9I2dqjsh018Oq/JZxq7tvFfk+LJF2rHoA6dKi3yuOkyXeCvOMAtgBV1dl5noqB1v0MkIezseI2VcqYgXPOM4QQa5LmU+4NA/CnGJITqsP17Jc5FGyZVZBHFnwOyIk6mwLAa0IPOXW+2EbC4Ivs0ZcCiR083KamJ2nwJ4QrbTHO5X6ca6B9aNRwHxeVbvSTIuVB/WPv6DNOQxmF7id8F5vPwm7rgNWeDUvuFob76MgQ8LAdlNmdIDbycmYkCZN3OC2jZSZm5r9ga+rVp5PlDKK/atBQ2JCpd//zXpIu9TVd7CFGMa6PWFRx9i7mQs4gRbaVEZZfr6i3F5YYDQxgOzRbOL1ZRPPepjxeNmPefsrlGeOTvg0lLCxyZ0M6aSWGmymxSKvfnEriQoRJqOkp42D91LXpAKhSHcDwVLM8eOMQarHHPDVjOXVzkamc5xaAuv/lFG2+GnHExxCatJX8iSNJ91B4YHetQqRRTe+/8BZLd1TihpBTM= jhon.ramirez@CO-IT020749"
}
