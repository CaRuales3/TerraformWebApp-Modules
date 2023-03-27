#Variables Network
variable "VPC_CIDR" {
    description = "IP Segment"
}
variable "subnet1_CIDR" {
    description = "Subnet IP Segment"
}
variable "subnet2_CIDR" {
    description = "Subnet IP Segment"
}

variable "subnet1Tag"{
    default = "TagSubnet1"
}
variable "subnet2Tag"{
    default = "TagSubnet2"
}

variable "GlobalAZ" {
    description = "AZ for VPC and instances"
    default = "us-east-1a"
}

variable "instance_type"{
    default = "t2.micro"
}
variable "ami_instance" {
    default = "ami-011899242bb902164"
}