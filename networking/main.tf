resource "ibm_is_vpc_address_prefix" "zone1_address_prefix" {
  name = "${var.zone1}-prefix"
  zone = var.zone1
  vpc  = var.vpc_id
  cidr = "10.241.0.0/18"
}

resource "ibm_is_vpc_address_prefix" "zone2_address_prefix" {
  name = "${var.zone2}-prefix"
  zone = var.zone2
  vpc  = var.vpc_id
  cidr = "10.241.64.0/18"
}

resource "ibm_is_vpc_address_prefix" "zone3_address_prefix" {
  name = "${var.zone3}-prefix"
  zone = var.zone3
  vpc  = var.vpc_id
  cidr = "10.241.128.0/18"
}

resource "ibm_is_public_gateway" "zone1_gateway" {
  name           = "${var.zone1}-pgw"
  vpc            = var.vpc_id
  zone           = var.zone1
  resource_group = var.resource_group
}

resource "ibm_is_public_gateway" "zone2_gateway" {
  name           = "${var.zone2}-pgw"
  vpc            = var.vpc_id
  zone           = var.zone2
  resource_group = var.resource_group
}

resource "ibm_is_public_gateway" "zone3_gateway" {
  name           = "${var.zone3}-pgw"
  vpc            = var.vpc_id
  zone           = var.zone3
  resource_group = var.resource_group
}

resource "ibm_is_subnet" "zone1_subnet" {
  name            = "${var.zone1}-subnet"
  vpc             = var.vpc_id
  zone            = var.zone1
  ipv4_cidr_block = "10.241.0.0/24"
  public_gateway  = ibm_is_public_gateway.zone1_gateway.id
}

resource "ibm_is_subnet" "zone2_subnet" {
  name            = "${var.zone2}-subnet"
  vpc             = var.vpc_id
  zone            = var.zone2
  ipv4_cidr_block = "10.241.64.0/24"
  public_gateway  = ibm_is_public_gateway.zone2_gateway.id
}

resource "ibm_is_subnet" "zone3_subnet" {
  name            = "${var.zone3}-subnet"
  vpc             = var.vpc_id
  zone            = var.zone3
  ipv4_cidr_block = "10.241.128.0/24"
  public_gateway  = ibm_is_public_gateway.zone3_gateway.id
}