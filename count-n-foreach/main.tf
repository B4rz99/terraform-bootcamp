# Using count
resource "aws_instance" "ob-ec2" {
  count        = 2
  ami          = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-${count.index}"
    bootcamp = "DevOps"
  }
}

# Using for each with map
variable "users" {
  default = {
    orlando = "admin"
    maria   = "ro"
  }
}

resource "aws_iam_user" "iam_roles" {
  for_each = var.users
  name     = each.key
  tags = {
    Rol = each.value
  }
}
