##############################################################################
# Sensitive Account Variables
##############################################################################

variable ibmcloud_api_key {
    description = "IBM Cloud IAM API Key"
}

variable resource_group {
    description = "Name of resource group to provision resources"
    default     = "default"
}

##############################################################################


##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    default     = "eu-de"
}

variable unique_id {
    description = "Prefix for all resources created in the module. Must begin with a letter."
    default     = "wireguard"
}

variable tags {
    description = "A list of tags for resources created"
    default     = ["terraform", "wireguard"]
}

##############################################################################


##############################################################################
# VPC variables
##############################################################################

variable generation {
    description = "VPC generation. Version 2 is recommended."
    default     = 2
}

variable number_of_zones {
    description = "Number of Availability Zones within a MZR."
    default     = 2
}

variable classic_access {
    description = "VPC Classic Access"
    default     = false
}

variable enable_public_gateway {
  description = "Enable public gateways, true or false"
  default     = true
}


##############################################################################
# Network variables
##############################################################################

variable acl_rules {
  default = [
    {
      name        = "egress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "inbound"
    },
    {
      name        = "ingress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "outbound"
    }
  ]
}

variable prefix_cidr_blocks {
    description = "List of CIDR blocks for the subnets"
    type        = list
    default     = [
        "10.10.0.0/18", 
        "10.20.0.0/18", 
        "10.30.0.0/18"
    ]  
}

variable subnet_cidr_blocks {
    description = "List of CIDR blocks for the subnets"
    type        = list
    default     = [
        "10.10.0.0/24", 
        "10.20.0.0/24", 
        "10.30.0.0/24"
    ]  
}

##############################################################################