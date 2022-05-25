resource "aws_ssm_parameter" "param" {
  name  = "db-password2"
  type  = "SecureString"
  value = random_password.password.result
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}


