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

data "external" "curlip" {
    program = ["sh", "-c", "echo '{ \"extip\": \"'$(curl -s https://ifconfig.me)'\" }'"]
}