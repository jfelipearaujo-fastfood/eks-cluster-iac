resource "aws_apigatewayv2_api" "api_gtw" {
  name          = "${var.cluster_name}-api_gtw"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "prd" {
  api_id = aws_apigatewayv2_api.api_gtw.id

  name        = "prd"
  auto_deploy = true
}
