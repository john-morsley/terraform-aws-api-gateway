#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "vpc_id" {
  value = module.simple-vpc.id
}

output "web_api_1_public_dns" {
  value = module.web-api-1-ec2.public_dns
}

output "wb_api_1_ssh_command" {
  value = module.web-api-1-ec2.ssh_command
}

output "web_api_1_endpoint_a" {
  value = "http://${module.web-api-1-ec2.public_dns}/api/v1/greeting"
}

output "web_api_1_endpoint_b" {
  value = "http://web-api-1.${var.domain}/api/v1/greeting"
}

output "web_api_2_public_dns" {
  value = module.web-api-2-ec2.public_dns
}

output "wb_api_2_ssh_command" {
  value = module.web-api-2-ec2.ssh_command
}

output "web_api_2_endpoint_a" {
  value = "http://${module.web-api-2-ec2.public_dns}/api/v1/grub"
}

output "web_api_2_endpoint_b" {
  value = "http://web-api-2.${var.domain}/api/v1/grub"
}

output "api_gateway_url" {
  value = module.api-gateway.url
}