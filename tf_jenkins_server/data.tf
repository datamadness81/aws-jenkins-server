#----------------------------------------------------
#                   DATA SOURCE
#----------------------------------------------------

data "aws_ami" "jenkins_server" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd*"]
  }

  filter {
    name   = "image-id"
    values = ["*04505e74c0741db8d"]
  }
}
