
output "subnet_names" {
  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.name
  }
}

output "subnet_address_prefixes" {
  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.address_prefixes
  }
}
