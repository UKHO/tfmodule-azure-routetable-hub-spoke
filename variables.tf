variable "spokerg" {
  description = "Name of spoke resource group"
  type        = string
}

variable "hubrg" {
  type = string
}

variable "hubrt" {
  description = "hub route table name"
}

variable "id" {
  description = "Environment identifier (used in VNet naming convention)"
  type        = string
}

variable "routetable" {
  description = "Spoke route table name"
  type        = string
}

variable "spokeroute" {
  description = "List of spoke route names"
  type        = list(string)
}

variable "hubroute" {
  description = "List of hub route names"
  type        = list(string)
}

variable "hop" {
  description = "List of next hop types (e.g. [\"VirtualNetworkGateway\"])"
  type        = list(string)
}

variable "nexthopipaddress" {
  description = "List of next hop IP addresses for routes"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Map of subnet IDs keyed by subnet name"
  type        = map(string)
}

variable "spokeprefix" {
  description = "List of route address prefixes"
  type        = list(string)
}

variable "hubprefix" {
  description = "List of route address prefixes"
  type        = list(string)
}
