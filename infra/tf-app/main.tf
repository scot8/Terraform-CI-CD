resource "azurerm_resource_group" "rg" {
  name     = "scot0568-githubactions-rg"
  location = "Canada Central"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "lab12-vnet"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  address_space       = ["10.0.0.0/16"]
}
 
resource "azurerm_subnet" "subnet" {
  name                 = "lab12-subnet"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}