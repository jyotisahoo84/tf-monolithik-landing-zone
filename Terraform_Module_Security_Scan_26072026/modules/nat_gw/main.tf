resource "azurerm_nat_gateway" "nat_gw" {
  for_each = var.natgw

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku_name            = each.value.sku
  
}

resource "azurerm_nat_gateway_public_ip_association" "pip_assoc" {
  for_each             = var.natgw
  
  nat_gateway_id       = azurerm_nat_gateway.nat_gw[each.key].id
  public_ip_address_id = data.azurerm_public_ip.nat_pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "nat_assoc" {
  for_each = var.natgw
  
  nat_gateway_id = azurerm_nat_gateway.nat_gw[each.key].id
  subnet_id = data.azurerm_subnet.snet[each.key].id
  
}