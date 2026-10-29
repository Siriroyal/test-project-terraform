terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
# Get Resources from a Resource Group
data "azurerm_resource_group" "example" {
  name = "Ind-Azure-PS-Sireesha"
}


resource "azurerm_virtual_network" "Vnet-tf" {
  name                = var.virtual_network_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet-tf" {
  for_each = var.dynamic_address_prefixes
  name                 = each.key
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.Vnet-tf.name
  address_prefixes     = each.value.address_prefixes
}
