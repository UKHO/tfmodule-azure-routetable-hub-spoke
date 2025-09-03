data "azurerm_resource_group" "main" {
  provider = azurerm.spoke
  name     = var.spokerg
}

data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hubrg
}

data "azurerm_route_table" "hub" {
  provider            = azurerm.hub
  name                = var.hubrt
  resource_group_name = data.azurerm_resource_group.hub.name
}