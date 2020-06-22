#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0" # All possible IP address range 

  vpc_name = "${var.name}-1-${random_pet.name.id}"

  web_api_1_name = "${var.name}-1-${random_pet.name.id}"
  web_api_2_name = "${var.name}-2-${random_pet.name.id}"

  bucket_name = "${var.name}-${random_pet.bucket.id}"

}