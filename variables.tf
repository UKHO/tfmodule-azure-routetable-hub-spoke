variable "spokerg" {
  description = "Name of spoke resource group"
}

variable "hubrg" {
  description = "Name of hub resource group"
}

variable "hubrt" {
  description = "Hub route table name"
}

variable "id" {
  description = "Environment you're deploying to"
}

variable "routetable" {
  description = "Spoke route table"
}

variable "subnets" {
  description = "List of subnet names"
  type        = list(string)
}

variable "spoke_routes" {
  description = "List of spoke routes"
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
}

variable "hub_routes" {
  description = "List of hub routes"
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
}



#variable "spokerg" {
# description = "name of spoke resource group"
#}
#variable "hubrg" {
# description = "name of hub resource group"
#}
#variable "hubrt" {
#  description = "hub route table name" 
#}
#variable "id" {
#  description = "environment you're deploying too"
#}
#variable "routetable" {
#  description = "spoke route table"
#}
#variable "spokeroute" {
#  description = "Spoke routetable route array"
#}
#variable "hubroute" {
#  description = "Hub routetable routes array"
#}
#variable "hop" {
#  description = "The type of hop you require in a array"
#}
#variable "nexthopipaddress" {
#  description = "The next hop IP address in a array, this is only required if the next hop type is set to VirtualAppliance"
#}
#variable "subnets" {
# description = "array contains names of subnets, the subnet array used on the tfmodule-azure-vnet-with-nsg fits this expected pattern" 
#}
#variable "spokeprefix" {
#  description = "Spoke ip route array"
#}
#variable "hubprefix" {
#  description = "Hub ip route array"
#}
