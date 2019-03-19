provider "aws" {
  profile = "your-profile-here"
  region  = "us-west-2"
}

resource "aws_instance" "example_ec2" {
  ami             = "ami-005bdb005fb00e791"
  instance_type   = "t2.micro"
  key_name        = "your-key-pair-here"
  vpc_security_group_ids = ["${aws_security_group.example_sg.id}"]

  tags {
    Name = "example_ec2"
  }
}

resource "aws_security_group" "example_sg" {

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}

output "instance_ip" {
  value = "${aws_instance.example_ec2.public_ip}"
}