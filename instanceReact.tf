
resource "aws_instance" "react" {
  ami           = "ami-047bb4163c506cd98"
  instance_type = "t1.micro"
  # key_name        = "jeremy-epsi-key"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id       = "${aws_subnet.subnet-uno.id}"

  tags = { Name = "react" }
  provisioner "file" {
    source      = "./source"
    destination = "/home"
  }
}
