##############################################################################
# Create an  ACL for ingress/egress used by all subnets in VPC
##############################################################################

resource ibm_is_network_acl multizone_acl {
  
  name = "${var.unique_id}-multizone-acl"
  vpc  = ibm_is_vpc.vpc.id

  dynamic rules {

    for_each = var.acl_rules

    content {
      name        = rules.value.name
      action      = rules.value.action
      source      = rules.value.source
      destination = rules.value.destination
      direction   = rules.value.direction
    }
  }
}


##############################################################################
# Create Security Groups used by all resources in VPC
##############################################################################

resource ibm_is_security_group sgs {
  
  #name = "${var.unique_id}-sgs"
  name = "scurvy-staring-candied-distincted"
  vpc  = ibm_is_vpc.vpc.id

  dynamic rules {

    for_each = var.sg_rules

    content {
      direction   = rules.value.direction
      ip_version  = rules.value.ip_version
      port_max    = rules.value.port_max
      port_min    = rules.value.port_min
      protocol    = rules.value.protocol
      remote      = rules.value.remote
    }
  }
}
