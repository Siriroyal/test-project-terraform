/*#creating vnet, and 2 subnets in existing RG
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
# reading from a existing Resource Group
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
*/

#Task 2: Creating 2 subnets using VNET, existing RG for modules

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Read the existing Resource Group
data "azurerm_resource_group" "example" {
  name = "Ind-Azure-PS-Sireesha"
}

# Create the VNet
resource "azurerm_virtual_network" "Vnet-tf" {
  name                = var.virtual_network_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  address_space       = var.address_space
}

# Call the reusable subnet module
module "subnets" {
  source = "./modules/subnet"
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.Vnet-tf.name
  subnets              = var.dynamic_address_prefixes
}

# Preserve the existing subnet resources in Terraform state
moved {
  from = azurerm_subnet.subnet-tf["bastionsubnet"]
  to   = module.subnets.azurerm_subnet.this["bastionsubnet"]
}

moved {
  from = azurerm_subnet.subnet-tf["firewall-subnet"]
  to   = module.subnets.azurerm_subnet.this["firewall-subnet"]
}
