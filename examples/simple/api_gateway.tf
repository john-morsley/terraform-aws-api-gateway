module "api-gateway" {

  source = "./../.."

  name        = "simple-example"
  description = "A simple example of an AWS API Gateway between 2 EC2 instances."

}