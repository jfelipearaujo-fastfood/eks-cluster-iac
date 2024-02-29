# resource "aws_security_group" "vpc_link" {
#   name   = "vpc-link"
#   vpc_id = var.vpc_id

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_apigatewayv2_vpc_link" "eks" {
#   name               = "eks"
#   security_group_ids = [aws_security_group.vpc_link.id]
#   subnet_ids         = [var.private_subnet_1a.id, var.private_subnet_1b.id]
# }

# resource "aws_apigatewayv2_integration" "eks" {
#   api_id = aws_apigatewayv2_api.main.id

#   integration_uri    = var.lb_arn
#   integration_type   = "HTTP_PROXY"
#   integration_method = "ANY"
#   connection_type    = "VPC_LINK"
#   connection_id      = aws_apigatewayv2_vpc_link.eks.id
# }

# resource "aws_apigatewayv2_route" "get_echo" {
#   api_id = aws_apigatewayv2_api.main.id

#   route_key = "GET /echo"
#   target    = "integrations/${aws_apigatewayv2_integration.eks.id}"
# }
