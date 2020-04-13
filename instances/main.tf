resource "ibm_is_instance" "nodes" {
  count = var.instance_count
  name    = "${var.hostname}-${var.zone}-${count.index + 1}"
  image   = data.ibm_is_image.ubuntu_18.id
  profile = data.ibm_is_instance_profile.base.id

  primary_network_interface {
    name   = "eth0"
    subnet = var.subnet
  }

  zone           = var.zone
  vpc            = var.vpc_id
  keys           = [data.ibm_is_ssh_key.us_east_dev.id]
  resource_group = var.resource_group
  tags           = ["ryantiffany", "region:${var.region}", "vpc:${var.hostname}"]
}