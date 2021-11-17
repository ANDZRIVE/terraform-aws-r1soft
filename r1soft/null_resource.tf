resource "null_resource" "r1soft_install" {
  depends_on = [aws_instance.r1soft, aws_security_group.r1soft]
  triggers = {
    always_run = timestamp()
  }
 
  provisioner "file" {
    connection {
      host        = aws_instance.r1soft.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    source      = "r1soft.repo"
    destination = "/tmp/r1soft.repo"
  }
  
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.r1soft.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    inline = [
      "sudo cp /tmp/r1soft.repo /etc/yum.repos.d/",
      "sudo  yum install r1soft-cdp-enterprise-server -y",
      "sudo r1soft-setup --user admin --pass redhat --http-port 80",
      "sudo systemctl restart cdp-server",
    ]
  }
}