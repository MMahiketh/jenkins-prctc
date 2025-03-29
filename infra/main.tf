resource "aws_instance" "jenkins" {
  ami           = local.ami_id
  instance_type = var.instance_type
  key_name      = "linux-key devops shiva"
  user_data     = file("setup.sh")

  user_data_replace_on_change = true
  vpc_security_group_ids      = [local.sg]

  tags = {
    Name      = "jenkins"
    Terraform = "True"
  }
}

resource "aws_route53_record" "jenkins" {
  zone_id         = local.zone_id
  name            = "jenkins.${local.zone_name}"
  type            = "A"
  ttl             = 300
  records         = [aws_instance.jenkins.public_ip]
  allow_overwrite = true
}
