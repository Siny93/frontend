data "aws_ami" "ami" {
  most_recent = true
  name_regex = "base_with_ansible"
  owners = ["self"]
}