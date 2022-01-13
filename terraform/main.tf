#---------------------------------------------------------
#                       COMPUTED
#---------------------------------------------------------

#---------------------JENKINS SERVER-----------------------

resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.jenkins_
  subnet_id              = aws_subnet.jen_pub_sub.id
  instance_type          = var.itype
  key_name               = aws_key_pair.ssh_key.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id, aws_security_group.ssh_jenkins_sg.id]
  
  tags = {
    Name = var.resource_name
  }

  root_block_device {
    volume_size = "30"
    encrypted   = false
  }
}

# Archivo inventory necesario para aplicar las configuraciones que se haran con ansible luego de implementar la intancia EC2
resource "local_file" "inventory" {
  filename = "inventory.yaml"
  content  = <<-EOT
  all:
    hosts:
      jenkins_server:
        ansible_host: ${aws_instance.jenkins_server.public_ip}
  EOT
}


