
resource "aws_instance" "react-epsi" {
  ami           = var.amis[var.region]
  instance_type = "t1.micro"
  key_name      = "jeremy-epsi"
  tags          = { Name = "react" }
  # provisioner "file" {
  #   source      = "./source"
  #   destination = "/home"
  # }
}
