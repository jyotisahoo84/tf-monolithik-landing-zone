data "azurerm_subnet" "snet" {
    for_each = var.bastion
  name                 = each.value.bastion_subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "nat_pip" {
    for_each = var.bastion
  name                = each.value.bastion_pip_name
  resource_group_name = each.value.rg_name
}