resource "azurerm_resource_group" "rgs" {

    for_each = var.res_grp
    name = each.value.name
    location = each.value.location
  
}