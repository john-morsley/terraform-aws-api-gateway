#      _____             _         _____ ____  
#     |  __ \           | |       | ____|___ \ 
#     | |__) |___  _   _| |_ ___  | |__   __) |
#     |  _  // _ \| | | | __/ _ \ |___ \ |__ < 
#     | | \ \ (_) | |_| | ||  __/  ___) |___) |
#     |_|  \_\___/ \__,_|\__\___| |____/|____/

data "aws_route53_zone" "morsley-io" {

  name         = var.domain
  private_zone = false

}

resource "aws_route53_record" "web-api-1" {

  zone_id = data.aws_route53_zone.morsley-io.zone_id
  name    = "web-api-1"
  type    = "A"
  ttl     = 300
  records = [module.web-api-1-ec2.public_ip]

}

resource "aws_route53_record" "web-api-2" {

  zone_id = data.aws_route53_zone.morsley-io.zone_id
  name    = "web-api-2"
  type    = "A"
  ttl     = 300
  records = [module.web-api-2-ec2.public_ip]

}