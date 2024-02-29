# resource "aws_apigatewayv2_api" "main" {
#   name          = "main"
#   protocol_type = "HTTP"
# }

# resource "aws_apigatewayv2_stage" "prd" {
#   api_id = aws_apigatewayv2_api.main.id

#   name        = "prd"
#   auto_deploy = true
# }
