#----------------------------------------------------
#                   SECURITY
#----------------------------------------------------

#--------------------KEY PAIR------------------------
resource "aws_key_pair" "ssh_key" {
  key_name   = "devops-key"
  public_key = var.ssh_key

  tags = {
    Name = var.resource_name
  }
}

#-------------------SECURITY GROUP--------------------

resource "aws_security_group" "jenkins_sg" {
  vpc_id = aws_vpc.jen_vpc.id

  ingress {
    description = "Browser connecction to Jenkins Server"
    protocol    = "TCP"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = [var.my_IP]
  }

  egress {
    description = "Jenkins server output traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.ipv4_default]
  }

  tags = {
    Name = var.resource_name
  }
}

resource "aws_security_group" "ssh_jenkins_sg" {
  vpc_id = aws_vpc.jen_vpc.id

  ingress {
    description = "SSH connecction"
    protocol    = "TCP"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.my_IP]
  }

  egress {
    description = "SSH output traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.ipv4_default]
  }

  tags = {
    Name = var.resource_name
  }
}

#----------------------IAM------------------------

resource "aws_iam_role" "devops_role" {
  name = "devops_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = var.resource_name
  }
}

resource "aws_iam_policy_attachment" "devops_policy_role" {
  name       = "devops_attachment"
  roles      = [aws_iam_role.devops_role.name]
  policy_arn = var.policy
}

resource "aws_iam_instance_profile" "devops_profile" {
  name = "devops_profile"
  role = aws_iam_role.devops_role.name
}
