terraform{
    required_providers {
    aws = {
        source  = "hashicorp/aws"
        #version = "~> 3.0"
    }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "Architecture_1"{
    source = "./Modules"
    # Input Variables Network
    VPC_CIDR = "10.0.0.0/16"
    subnet1_CIDR = "10.0.0.0/28"
    subnet2_CIDR = "10.0.0.16/28"
    # Input Variables Compute
    }