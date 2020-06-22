#      _____             _
#     |  __ \           | |
#     | |  | | ___   ___| | _____ _ __
#     | |  | |/ _ \ / __| |/ / _ \ '__|
#     | |__| | (_) | (__|   <  __/ |
#     |_____/ \___/ \___|_|\_\___|_|

module "web-api-1-ec2" {

  source = "./../../../terraform-aws-ec2"
  //source = "john-morsley/ec2/aws"

  name = local.web_api_1_name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.simple-vpc.id

  iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.simple-vpc.public_subnet_ids[0]

  security_group_ids = [module.allow-all.id]

  availability_zone = data.aws_availability_zones.available.names[0]

  bucket_name = local.bucket_name

  docker = true

  mock_depends_on = [
    module.s3_bucket
  ]

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "install-web-ap1i-1" {

  depends_on = [
    module.web-api-1-ec2
  ]

  connection {
    type        = "ssh"
    host        = module.web-api-1-ec2.public_ip
    user        = "ubuntu"
    private_key = base64decode(module.web-api-1-ec2.encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.module}/web_api_1.sh"
    destination = "web_api.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x web_api.sh && bash web_api.sh"]
  }

}
