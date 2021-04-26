provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_lightsail_instance" "gitlab_silver" {
  name              = "silver_ligthsail"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_2_0"
  key_pair_name     = ""
  tags = {
    projeto = "contracao"
  }
}

resource "aws_lightsail_static_ip" "test" {
  name = "silver_ligthsail_1"
}

resource "aws_lightsail_static_ip_attachment" "test" {
  static_ip_name = aws_lightsail_static_ip.test.name
  instance_name  = aws_lightsail_instance.gitlab_silver.name
}

output "static_ip" {
  value       = aws_lightsail_static_ip.test.ip_address
  description = " The ARN of the Lightsail instance."
}
