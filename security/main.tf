# resource "ibm_is_security_group" "consul_security_group" {
#     name = "consul-sg"
#     resource_group = data.ibm_resource_group.cde.id
#     vpc = ibm_is_vpc.dev.id
# }

#  resource "ibm_is_security_group_rule" "security_group_rule_tcp" {
#     group = ibm_is_security_group.consul_security_group.id
#     direction = "inbound"
#     remote = "0.0.0.0"
#     tcp {
#         port_min = 8500
#         port_max = 8502
#     }
#  }

#   resource "ibm_is_security_group_rule" "lan_wan_tcp" {
#     group = ibm_is_security_group.consul_security_group.id
#     direction = "inbound"
#     remote = "0.0.0.0"
#     tcp {
#         port_min = 8301
#         port_max = 8302
#     }
#  }