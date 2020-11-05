provider "azurerm" {
  alias           = "spoke"
}

provider "azurerm" {
  alias           = "hub"
}

locals {
  vnet_name = "${var.id}-vnet"
}

data "azurerm_resource_group" "main" {
  provider = azurerm.spoke
  name     = var.spokerg
}

resource "azurerm_route_table" "main" {
  provider                      = azurerm.spoke
  name                          = var.routetable
  location                      = data.azurerm_resource_group.main.location
  resource_group_name           = data.azurerm_resource_group.main.name
  disable_bgp_route_propagation = false

  route {
    name           = var.routeaddress
    address_prefix = var.hubprefix
    next_hop_type  = var.hop
  }
  lifecycle { ignore_changes = [tags] }
}

data "azurerm_subnet" "main" {
  count                = length(var.subnets)
  provider             = azurerm.spoke
  name                 = var.subnets[count.index].name
  resource_group_name  = var.spokerg
  virtual_network_name = local.vnet_name
}

resource "azurerm_subnet_route_table_association" "main" {
  count          = length(var.subnets)
  provider       = azurerm.spoke
  subnet_id      = data.azurerm_subnet.main[count.index].id
  route_table_id = azurerm_route_table.main.id
}

data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hubrg
}

data "azurerm_route_table" "main" {
  provider            = azurerm.hub
  name                = var.hubrt
  resource_group_name = data.azurerm_resource_group.hub.name
}

resource "azurerm_route" "main" {
  provider            = azurerm.hub
  name                = var.route
  resource_group_name = data.azurerm_resource_group.hub.name
  route_table_name    = data.azurerm_route_table.main.name
  address_prefix      = var.spokeprefix
  next_hop_type       = var.hop
}
