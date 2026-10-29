/* Task1: created vnet, 2 subnets using existing RG
output "resource_group_name" {
  value = data.azurerm_resource_group.example.id
}

output "subnet_name" {
  value = [for subnet in azurerm_subnet.subnet-tf : subnet.name]
}

output "subnet_addressprefix" {
  value = [for subnet in azurerm_subnet.subnet-tf : subnet.address_prefixes]
} 
*/

#task2: creating 2 subnets for modules


output "resource_group_name" {
  value = data.azurerm_resource_group.example.name
}

output "vnet_name" {
  value = azurerm_virtual_network.Vnet-tf.name
}

output "subnet_names" {
  value = module.subnets.subnet_names
}

output "subnet_addressprefix" {
  value = module.subnets.subnet_address_prefixes
}
