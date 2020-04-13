resource "random_id" "name" {
  byte_length = 2
}

locals {
  zone1          = "${var.region}-1"
  zone2          = "${var.region}-2"
  zone3          = "${var.region}-3"
  environment    = "${random_id.name.hex}-dc7" #dawn-cloud-7
  instance_count = 5
}

resource "ibm_is_vpc" "dev" {
  resource_group            = data.ibm_resource_group.cde.id
  name                      = local.environment
  address_prefix_management = "manual"
  tags                      = ["ryantiffany", "terraform", "${local.environment}", "region:${var.region}"]
}


module "networking" {
  source         = "./networking"
  vpc_id         = ibm_is_vpc.dev.id
  zone1          = local.zone1
  zone2          = local.zone2
  zone3          = local.zone3
  resource_group = data.ibm_resource_group.cde.id
}

module "zone1_instances" {
  source         = "./instances"
  zone           = local.zone1
  vpc_id         = ibm_is_vpc.dev.id
  instance_count = local.instance_count
  hostname       = local.environment
  resource_group = data.ibm_resource_group.cde.id
  region         = var.region
  subnet         = module.networking.zone1_subnet_id
}

module "zone2_instances" {
  source         = "./instances"
  zone           = local.zone2
  vpc_id         = ibm_is_vpc.dev.id
  instance_count = local.instance_count
  hostname       = local.environment
  resource_group = data.ibm_resource_group.cde.id
  region         = var.region
  subnet         = module.networking.zone2_subnet_id
}





# module "security" {
#   source = "./security"
# }

# resource "ibm_is_security_group" "consul_security_group" {
#   name           = "consul-sg"
#   resource_group = data.ibm_resource_group.cde.id
#   vpc            = ibm_is_vpc.dev.id
# }

# resource "ibm_is_security_group_rule" "security_group_rule_tcp" {
#   group     = ibm_is_security_group.consul_security_group.id
#   direction = "inbound"
#   remote    = "0.0.0.0"
#   tcp {
#     port_min = 8500
#     port_max = 8502
#   }
# }

# resource "ibm_is_security_group_rule" "lan_wan_tcp" {
#   group     = ibm_is_security_group.consul_security_group.id
#   direction = "inbound"
#   remote    = "0.0.0.0"
#   tcp {
#     port_min = 8301
#     port_max = 8302
#   }
# }