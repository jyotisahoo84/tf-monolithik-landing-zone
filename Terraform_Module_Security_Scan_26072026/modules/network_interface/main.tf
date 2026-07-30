resource "azurerm_network_interface" "nics" {

    for_each = var.net_int
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.rg_name

    ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snets[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
  
}