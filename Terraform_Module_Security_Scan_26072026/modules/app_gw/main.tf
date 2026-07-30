resource "azurerm_application_gateway" "appgws" {

  for_each = var.appgw

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip"
    subnet_id = data.azurerm_subnet.appgw_subnet[each.key].id
  }

  frontend_port {
    name = "port80"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = data.azurerm_public_ip.appgw_pip[each.key].id

  }

  backend_address_pool {
    name = "backendpool"
    ip_addresses = [
      data.azurerm_network_interface.vm1_nic[each.key].private_ip_address,
      data.azurerm_network_interface.vm2_nic[each.key].private_ip_address
    ]

  }

  backend_http_settings {
    name                  = "http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }

  probe {
    name = "health-probe"
    protocol = "Http"
    path = "/"
    interval = 30
    timeout = 30
    unhealthy_threshold = 3
    host = "127.0.0.1"
    match {

      status_code = ["200-399"]

    }

  }

  http_listener {
    name = "listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name = "port80"
    protocol = "Http"
  }

  request_routing_rule {
    name = "rule1"
    priority = 100
    rule_type = "Basic"
    http_listener_name = "listener"
    backend_address_pool_name = "backendpool"
    backend_http_settings_name = "http-setting"
  }

}