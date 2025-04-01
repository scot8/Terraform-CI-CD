resource "azurerm_resource_group" "rg" {
  name     = "scot0568-githubactions-rg"
  location = "Canada Central"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}


