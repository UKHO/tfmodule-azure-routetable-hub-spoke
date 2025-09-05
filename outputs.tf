output "route_table_id" {
  description = "The ID of the Azure Route Table"
  value       = azurerm_route_table.main.id
}
