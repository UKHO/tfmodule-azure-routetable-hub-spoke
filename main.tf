provider "azurerm" {
  alias = "hub"
}

provider "azurerm" {
  alias = "spoke"
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
}

data "azurerm_subnet" "main" {
  provider = azurerm.spoke  
  name = var.api    
  resource_group_name = var.spokerg
  virtual_network_name = local.vnet_name
}

resource "azurerm_subnet_route_table_association" "main" {
  provider       = azurerm.spoke  
  subnet_id      = data.azurerm_subnet.main.id
  route_table_id = azurerm_route_table.main.id
}

 data "azurerm_subnet" "main1" {
  provider = azurerm.spoke   
  name = var.nsb    
  resource_group_name = var.spokerg
  virtual_network_name = local.vnet_name
}

resource "azurerm_subnet_route_table_association" "main1" {
  provider       = azurerm.spoke  
  subnet_id      = data.azurerm_subnet.main1.id
  route_table_id = azurerm_route_table.main.id
}

data "azurerm_subnet" "main2" {
  provider = azurerm.spoke
  name = var.web    
  resource_group_name = var.spokerg
  virtual_network_name = local.vnet_name
}

resource "azurerm_subnet_route_table_association" "main2" {
  provider       = azurerm.spoke
  subnet_id      = data.azurerm_subnet.main2.id
  route_table_id = azurerm_route_table.main.id
}
 
data "azurerm_resource_group" "hub" {
  provider = azurerm.hub  
  name = var.hubrg
}

data "azurerm_route_table" "main" {
  provider = azurerm.hub  
  name = var.hubrt
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
