resource "azurerm_bastion_host" "azure_bastion" {
    for_each = var.bastion

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.snet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.nat_pip[each.key].id
  }
}