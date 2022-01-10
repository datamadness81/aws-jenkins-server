#----------------------------------------------------
#                   DATA SOURCE
#----------------------------------------------------

data "aws_ami" "jenkins_server" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    image_id   = "id"
    values = ["ami-04505e74c0741db8d"]
  }
}
