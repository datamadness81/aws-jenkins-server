#----------------------------------------------------
#                   DATA SOURCE
#----------------------------------------------------

data "aws_ami" "jenkins_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]

}

# Con este comando obtenemos la ip publica del local, la cual es necesaria para configurar los ingress de los grupos de seguridad
data "http" "ip" {
  url = "https://ifconfig.me/ip"
}