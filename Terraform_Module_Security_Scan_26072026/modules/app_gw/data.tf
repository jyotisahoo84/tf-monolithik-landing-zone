data "azurerm_subnet" "appgw_subnet" {

  for_each = var.appgw

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name

}

data "azurerm_public_ip" "appgw_pip" {
    for_each = var.appgw
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "vm1_nic" {
    for_each = var.appgw
  name                = each.value.vm_linux1_nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_interface" "vm2_nic" {
  for_each = var.appgw
  name                = each.value.vm_linux2_nic_name
  resource_group_name = each.value.rg_name
}