resource "aws_instance" "component" {
  count = length(var.components)
  ami = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  subnet_id = var.subnets[0]

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }
  tags = {
    Name = var.components[count.index]
  }
  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}
resource "aws_route53_record" "records" {
  count   = length(var.components)
  name    = "${var.components[count.index]}-${count.index}"
  type    = "A"
  zone_id = var.zone_id
  records = [aws_instance.component[count.index].private_ip]
  ttl     = 5
}
