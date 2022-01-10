#---------------------------------------------------------
#                       COMPUTED
#---------------------------------------------------------

#---------------------JENKINS SERVER-----------------------

resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.jenkins_server.id
  subnet_id              = aws_subnet.jen_pub_sub.id
  instance_type          = var.itype
  key_name               = aws_key_pair.ssh_key.id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id, aws_security_group.ssh_jenkins_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.devops_profile.name

  tags = {
    Name = var.resource_name
  }

  root_block_device {
    volume_size = "30"
    encrypted   = false
  }
}

resource "local_file" "inventory" {
  filename = "inventory.yaml"
  content  = <<-EOT
  all:
    hosts:
      jenkins_server:
        ansible_host: ${aws_instance.jenkins_server.public_ip}
  EOT
}
