##############################################################################
# Create an  ACL for ingress/egress used by all subnets in VPC
##############################################################################

resource ibm_is_network_acl multizone_acl {
  
  name = "${var.unique_id}-multizone-acl"
  vpc  = "${var.generation == 2 ? null : ibm_is_vpc.vpc.id}"

  dynamic rules {

    for_each = "${var.acl_rules}"

    content {
      name        = "${rules.value.name}"
      action      = "${rules.value.action}"
      source      = "${rules.value.source}"
      destination = "${rules.value.destination}"
      direction   = "${rules.value.direction}"
    }
  }
}

##############################################################################