resource "aws_instance" "python" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "${local.resource_name}"
  }

  connection {
  type     = "ssh"
  host     = self.public_ip
  user     = "ec2-user"
  password = "Dev0ps321"
}

  provisioner "file" {
  source      = "${path.module}/app.py"
  destination = "/home/ec2-user/app.py"
}

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install python3 python3-pip -y",
      "pip3 install flask",
      "nohup python3 /home/ec2-user/app.py > /home/ec2-user/flask.log 2>&1 &"
    ]
  }
}