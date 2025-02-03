resource "aws_security_group" "security_group" {
  ingress {
    from_port = 5672
    to_port   = 5672
    protocol = "TCP"
    cidr_blocks = var.server_app_port_cidr
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.id
  subnet_id              = var.subnets[0]
  vpc_security_group_ids = [aws_security_group.security_group.id]
  instance_type          = var.instance_type
  root_block_device{
    encrypted  = true
    kms_key_id = var.kms_key_id
  }
  tags = {
    Name = var.component
    env = var.env
  }
}
# to run rabbitmq.sh through provisioner
resource "null_resource" "rabbitmq" {
  connection {
    type     =   "ssh"
    port     =    22
    host     =    aws_instance.instance.private_ip
    user     =    "admin"
    password =    "expenseAppe123"
  }
  provisioner "file" {
    source        =  "${path.module}/rabbitmq.sh"
    destination   = "/tmp/rabbitmq.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/rabbitmq.sh"
    ]
  }
}





