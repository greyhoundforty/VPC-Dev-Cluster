data "ibm_is_images" "east_images" {}
data "ibm_is_instance_profiles" "east_profiles" {}

data "ibm_is_image" "ubuntu_18" {
  name = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}

data "ibm_is_ssh_key" "us_east_dev" {
  name = "tycho-us-east"
}

data "ibm_is_instance_profile" "base" {
  name = "bx2-4x16"
}

data "ibm_is_zones" "east" {
  region = "us-east"
}

data "ibm_resource_group" "cde" {
  name = "CDE"
}