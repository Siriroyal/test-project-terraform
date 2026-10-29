output "resource_group_name" {
  value = data.azurerm_resource_group.example.id
}

output "subnet_name" {
  value = [for subnet in azurerm_subnet.subnet-tf : subnet.name]
}

output "subnet_addressprefix" {
  value = [for subnet in azurerm_subnet.subnet-tf : subnet.address_prefixes]
}