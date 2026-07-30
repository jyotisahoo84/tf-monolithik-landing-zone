data "azurerm_subnet" "snet" {
    for_each = var.natgw
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "nat_pip" {
  for_each = var.natgw
  name                = each.value.nat_pip_name
  resource_group_name = each.value.rg_name
}