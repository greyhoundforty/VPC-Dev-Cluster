# resource "local_file" "ansible_hosts" {
#   content = <<EOF
# PROFILES=
# ZONES=data.ibm_is_zones.east.zones
# IMAGES=data.ibm_is_images.east_images

# EOF

#   filename = "${path.cwd}/output.txt"
# }

# output "profiles" {
#     value = data.ibm_is_instance_profiles.east_profiles
# }

# output "vpc_name" {
#   value = "dev-${random_id.name.hex}"
# }

output "zones_in_region" {
  value = data.ibm_is_zones.east.zones
}

# output "subnets_in_new_vpc" {
#   value = ibm_is_vpc.dev.subnets
# }

# output "timestamp" {
#   value = formatdate("DD MMM YYYY hh:mm ZZZ" timestamp())
# }

