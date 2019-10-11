# Provider Configuration for AWS
provider "aws" {
  region     = "us-east-1"
}

# Resource Configuration for AWS
resource "aws_instance" "demothinknyxconf" {
#  ami = "ami-030ff268bd7b4e8b5"
  ami = "ami-02e8a9868af83730a"
  instance_type = "t2.small"
  key_name = "thinknyxconf"
  vpc_security_group_ids = ["sg-fd5804b1"]

  tags = {
    Name = "thinknyxconf"
  }

#  tags {
#    Name = "thinknyxconf"
#  }

# Provisioner for passwordless authentication
  provisioner "remote-exec" {
    connection {
      user = "centos"
      private_key = "${file("/root/.ssh/thinknyxconf.pem")}"
      host = "${self.private_ip}"
    }
  }

  provisioner "file" {
    source      = "/root/.ssh/id_rsa.pub"
    destination = "/home/centos/.ssh/authorized_keys"
  }

  connection {
    user = "centos"
    private_key = "${file("/root/.ssh/thinknyxconf.pem")}"
    host = "${self.private_ip}"
  }


  provisioner "local-exec" {
    command = "sudo echo '${self.public_ip}' >> ./hosts"
  }

  provisioner "local-exec" {
    command = "sudo echo '${self.public_ip}' > ./docker_host"
  }

}

# IP address of newly created EC2 instance
output "demothinknyxconf" {
 value = "${aws_instance.demothinknyxconf.public_ip}"
}
