
locals {
  vnet_name = "${var.id}-vnet"
}

resource "azurerm_route_table" "main" {
  provider            = azurerm.spoke
  name                = var.routetable
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_subnet_route_table_association" "main" {
  for_each       = var.subnet_ids
  provider       = azurerm.spoke
  subnet_id      = each.value
  route_table_id = azurerm_route_table.main.id
}

resource "azurerm_route" "spoke" {
  for_each = {
    for idx, route_name in var.spokeroute : route_name => {
      name                   = route_name
      address_prefix         = var.spokeprefix[idx]
      next_hop_type          = var.hop[idx]
      next_hop_in_ip_address = var.hop[idx] == "VirtualAppliance" ? var.nexthopipaddress[idx] : null
    }
  }

  provider               = azurerm.spoke
  name                   = each.value.name
  resource_group_name    = data.azurerm_resource_group.main.name
  route_table_name       = azurerm_route_table.main.name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
} 

