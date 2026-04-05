resource "aws_instance" "webserver" {
  ami                     = "var.instanceami"
  instance_type           = "var.instancetype"
  vpc_security_group_ids  = ["var.sg", "aws_security_group.webserversg.id" , "data.aws_security_group.sg_gui.id"]
  key_name                = "var.keyname"
  count                   = var.nosofinstances
  disable_api_termination = var.api_termination

  tags = {
    Name = "webserver_instance"
    purpose = "learning-terraform"
  }

user_data = <<-EOF
            #!/bin/bash
            sudo -i
            apt install apache2 -y
            systemctl start apache2
            EOF
}


data "aws_security_group" "sg_gui" {
  filter {
    name   = "group-name"
    values = ["rdssecurity"]
  }
}


#output "webserver_public_ip" {
  #value = aws_instance.webserver.public_ip
}   

# "webserver_instance_id" {
  #value = aws_instance.webserver.id
}

#output "webserver_public_dns" {
  #value = aws_instance.webserver.public_dns
}

#output "webserver_instance_state" {
  #value = aws_instance.webserver.instance_state
}   

#output "webserver_sg_id" {
  #value = aws_security_group.webserversg.id
}

#output "webserver_sg_arn" {
  #value = aws_security_group.webserversg.arn
}


