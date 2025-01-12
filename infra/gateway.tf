resource "aws_api_gateway_rest_api" "api_gateway" {
  name = "fiapx-gateway"
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  stage_name  = "prod"
}