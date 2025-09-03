# Terraform Module: for Azure route table with multiple routes

## Required Resources

- `Resource Group` exists or is created external to the module.
- `Provider` must be created external to the module.

## Usage

```terraform
# Route Tables Additional Routes

## Creating multiple routes under the spoke and hub tables

## Usage Vars

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

## Module

module "routetable" {
  source    = "github.com/UKHO/tfmodule-azure-routetable-hub-spoke?ref=v0.7.0"
  providers = {
    azurerm.spoke = azurerm.spoke
    azurerm.hub   = azurerm.hub
  }
  spokerg      = local.spokerg
  hubrg        = local.hubrg
  hubrt        = local.hubrt
  id           = local.id
  routetable   = local.routetable
  spokeroute   = local.spokeroute
  hubroute     = local.hubroute
  hop          = local.hop
  subnet_ids   = module.spokesetup.subnet_ids
  spokeprefix  = local.spokeprefix
  hubprefix    = local.hubprefix
}