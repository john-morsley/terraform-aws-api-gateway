# https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html
#
resource "aws_api_gateway_rest_api" "rest-api-gw" {
  name        = local.api_gateway_name
  description = var.description

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# https://www.terraform.io/docs/providers/aws/r/api_gateway_resource.html

# https://morsley.io/v1/year-planner?year=2020#november
#                    \/
#                    |
resource "aws_api_gateway_resource" "version" {
  rest_api_id = aws_api_gateway_rest_api.rest-api-gw.id
  parent_id   = aws_api_gateway_rest_api.rest-api-gw.root_resource_id
  path_part   = "{version}"
}

# https://morsley.io/v1/year-planner?year=2020#november
#                       \__________/
#                            |
resource "aws_api_gateway_resource" "namespace" {
  rest_api_id = aws_api_gateway_rest_api.rest-api-gw.id
  parent_id   = aws_api_gateway_resource.version.id
  path_part   = "{namespace}"
}

# https://morsley.io/v1/year-planner?year=2020#november
#                                   \_________________/
#                                           |
resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.rest-api-gw.id
  parent_id   = aws_api_gateway_resource.namespace.id
  path_part   = "{proxy+}"
}

# https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html
#
resource "aws_api_gateway_method" "any" {
  rest_api_id   = aws_api_gateway_rest_api.rest-api-gw.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"
  #api_key_required = true

  request_parameters = {
    "method.request.path.version"   = true
    "method.request.path.namespace" = true
    "method.request.path.proxy"     = true
  }
}

# https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html
#        
resource "aws_api_gateway_integration" "integration" {
  rest_api_id = aws_api_gateway_rest_api.rest-api-gw.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.any.http_method

  type                    = "HTTP_PROXY"
  uri                     = "http://web-api-1.morsley.io/api/{version}/{namespace}/{proxy}"
  integration_http_method = "ANY"
  passthrough_behavior    = "WHEN_NO_MATCH"

  request_parameters = {
    "integration.request.path.version"   = "method.request.path.version"
    "integration.request.path.namespace" = "method.request.path.namespace"
    "integration.request.path.proxy"     = "method.request.path.proxy"
  }
  
  depends_on = [
    aws_api_gateway_method.any,
    aws_api_gateway_resource.proxy
  ]
}

resource "aws_api_gateway_deployment" "development" {
  depends_on  = [aws_api_gateway_method.any]
  rest_api_id = aws_api_gateway_rest_api.rest-api-gw.id
  stage_name  = "DEVELOPMENT"
}