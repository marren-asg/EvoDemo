#
# Env
#
variable "rg_name" {
  type    = string
  default = "evo-demo-weu"
}

variable "location" {
  default = "north europe" //"west europe"
}
variable "prefix" {
  description = "Please enter a unique three digit prefix number (between 000-999)" 
}


#
# Netw
#
variable "vnet_name" {
  default = "vm-vnet-weu"
}

variable "snet_name" {
  default = "vm-snet-weu"
}



#
# VM-config
#
variable "vm_size" {
  default = "Standard_DS2_v2" //exists
}
variable "vm_name" {
  default = "test-vm"
}
variable "vm_admin_user" {
  default = "adminuser"
}
variable "admin_username" {
  default = "adminuser"
}
variable "admin_password" {
  default = "T0pSecP@ssw0rd123"
}

#
# Tags
# 
variable "tags" {
  type = map(string)
  default = {
    Owner           = "evo-demo"
    OwnerCostCenter = "vem vet?"
  }
}