

module "firewall" {

  source                               = "Azure/avm-res-network-azurefirewall/azurerm"
  version                              = "0.4.0"
  name                                 = var.naming_map.firewall.name
  enable_telemetry                     = var.enable_telemetry
  location                             = var.azure_location
  resource_group_name                  = var.network_resource_group_name
  firewall_sku_tier                    = var.firewall_sku_tier
  firewall_sku_name                    = var.firewall_sku_name
  firewall_zones                       = var.azure_location_zones
  firewall_ip_configuration            = local.firewall_ip_configuration
  firewall_management_ip_configuration = var.firewall_management_ip_configuration
  firewall_private_ip_ranges           = var.firewall_private_ip_ranges
  firewall_policy_id                   = local.effective_firewall_policy_id
  tags                                 = var.azure_resource_tags
  diagnostic_settings                  = var.diagnostic_settings
}
