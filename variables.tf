variable "virtual_network_name" {
  type = string
  default = "Hub-Vnet-terraform"
}
#variable "subnet_name" {
 # type = string
  #default = "subnet-terraform"
#}
variable "address_space" {
  type = list(string)
default = [ "10.0.0.0/16" ]
}
#variable "address_prefixes" {
  #type = list(string)
#default = [ "10.0.1.0/24" ]
#}

variable "dynamic_address_prefixes" {
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {
    bastionsubnet = {
      address_prefixes = ["10.0.1.0/26"]
    }

    firewall-subnet= {
      address_prefixes = ["10.0.2.0/24"]
    }

  }
}