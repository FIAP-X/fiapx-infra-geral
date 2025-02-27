resource "aws_cognito_user_pool" "user_pool" {
  name              = "fiapx-user-pool"
  mfa_configuration = "OFF"

  schema {
    name                = "name"
    attribute_data_type = "String"
    required            = true
  }

  schema {
    name                = "email"
    attribute_data_type = "String"
    required            = true
  }

  username_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name            = "client-users"
  user_pool_id    = aws_cognito_user_pool.user_pool.id
  generate_secret = false
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
}