resource "null_resource" "app-deploy" {
  count = length(aws_spot_instance_request.ec2-spot)

  connection {
    type = "ssh"
    user = local.SSH_USERNAME
    password = local.SSH_PASSWORD
    host = aws_spot_instance_request.ec2-spot.*.private_ip[count.index]
  }
  provisioner "remote-exec" {


    inline = [
      "ansible-pull -U https://github.com/Siny93/ANSIBLE1.git roboshop-pull.yml -e COMPONENT=${var.COMPONENT} -e ENV=${var.ENV} -e APP_VERSION=${APP_VERSION}"
    ]
  }
}

locals {
  NEXUS_USERNAME = nonsensitive(jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["NEXUS_USERNAME"])
  NEXUS_PASSWORD = nonsensitive(jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["NEXUS_PASSWORD"])
  SSH_USERNAME = nonsensitive(jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["SSH_USERNAME"])
  SSH_PASSWORD = nonsensitive(jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["SSH_PASSWORD"])
}