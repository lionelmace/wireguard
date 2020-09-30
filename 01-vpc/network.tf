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
# Create Default Security Groups
##############################################################################

resource ibm_is_security_group default_sg {
  
  name       = "${var.unique_id}-sg"
  vpc        = ibm_is_vpc.vpc.id
}

##############################################################################
# Create Security Groups used by all resources in VPC
##############################################################################

resource ibm_is_security_group_rule sgs {
  count = length(var.sg_rules)

  group = ibm_is_security_group.default_sg.id

  direction = "var.sg_rules[${count.index}].direction"
}
