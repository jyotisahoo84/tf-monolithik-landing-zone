resource "azurerm_linux_virtual_machine" "linux_vms" {

    for_each = var.vms

    name                = each.value.name
    resource_group_name = each.value.rg_name
    location            = each.value.location
    size                = each.value.size
    computer_name                   = each.value.hostname
    admin_username                  = each.value.user
    admin_password                  = each.value.password
    disable_password_authentication = false
    network_interface_ids = [data.azurerm_network_interface.vm_nic[each.key].id]

    os_disk {
        name                 = each.value.os_disk
        caching              = "ReadWrite"
        storage_account_type = "StandardSSD_LRS"

        }

    source_image_reference {
        publisher = "Canonical"
         offer     = "ubuntu-24_04-lts"
        sku       = "server"
        version   = "latest"

        }
  
}