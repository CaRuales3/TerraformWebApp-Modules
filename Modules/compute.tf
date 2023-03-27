/* Create Ubuntu server and install/enable apache2 */

resource "aws_instance" "Instance1" {
    subnet_id         = aws_subnet.Subnet_Prod_Public.id
    ami               = var.ami_instance
    instance_type     = var.instance_type
    availability_zone = var.GlobalAZ
    associate_public_ip_address = true
    #key_name          = var.keyname
    key_name          = "MainKey"
    vpc_security_group_ids = [aws_security_group.SecGroup-1.id]

    user_data = <<-EOF
                    #!/bin/bash
                    sudo apt update -y
                    sudo apt install apache2 -y
                    sudo systemctl start apache2
                    sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                    EOF
    tags = {
        Name = "web-server"
    }
}