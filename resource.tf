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
