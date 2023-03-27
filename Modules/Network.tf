/*VPC*/
resource "aws_vpc" "VPC_Prod" {
    #cidr_block       = "10.0.0.0/16"
    cidr_block = var.VPC_CIDR
    instance_tenancy = "default"

    tags = {
    Name = "VPC Prod"
    }
}

/*Internet GTWY*/
resource "aws_internet_gateway" "InterGtwy" {
    vpc_id = aws_vpc.VPC_Prod.id

    tags = {
    Name = "InterGtwy"
    }
}


/*Routing table*/

resource "aws_route_table" "RouteTable" {
    vpc_id = aws_vpc.VPC_Prod.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.InterGtwy.id
    }

    tags = {
    Name = "RouteTable"
    }  
}

/*VPC - Subnet1*/
resource "aws_subnet" "Subnet_Prod_Public" {
    vpc_id     = aws_vpc.VPC_Prod.id
    cidr_block = var.subnet1_CIDR
    #cidr_block = var.subnet1_CIDR[0]
    #cidr_block = var.subnet1_CIDR[0].cidr_block
    map_public_ip_on_launch = true
    availability_zone = var.GlobalAZ

    tags = {
    Name = var.subnet1Tag
    }

}

/*VPC - Subnet2*/
resource "aws_subnet" "Subnet_Prod_Public2" {
    vpc_id     = aws_vpc.VPC_Prod.id
    cidr_block = var.subnet2_CIDR
    #cidr_block = var.subnet1_CIDR[1]
    #cidr_block = var.subnet1_CIDR[1].cidr_block
    map_public_ip_on_launch = true
    availability_zone = var.GlobalAZ

    tags = {
        Name = var.subnet2Tag
    }

}

/*Assign route table to subnet*/
resource "aws_route_table_association" "RouteTableAsocc" {
    subnet_id      = aws_subnet.Subnet_Prod_Public.id
    route_table_id = aws_route_table.RouteTable.id
}
