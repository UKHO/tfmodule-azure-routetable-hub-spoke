  
variable "spokerg" {
  description = "name of spoke resource group"
}
variable "hubrg" {
  description = "name of hub resource group"
}
variable "hubrt" {
  description = "hub route table name" #This will likely be in core services
}
variable "id" {
  description = "environment you're deploying too"
}
variable "routetable" {
  description = "name of route table to be created"
}
variable "routeaddress" {
  description = "route address name" #to-M-ENVIRONMENT-route 
}
variable "route" {
  description = "route address for hub" #to-M-ENVIRONMENT-route
}
variable "hop" {
 description = "Array of type of hop required, related to hub and spoke prefixes"
}

variable "subnets" {
  description = "array contains names of subnets, the subnet array used on the tfmodule-azure-vnet-with-nsg fits this expected pattern"
}  
variable "hubprefix" {
  description = "array of hub vnet range prefixes" 
}
variable "spokeprefix" {
  description = "array of spoke vnet range prefixes" 
}



