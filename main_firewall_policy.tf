
module "firewall_policy" {

  source                                        = "Azure/avm-res-network-firewallpolicy/azurerm"
  version                                       = "0.3.3"
  count                                         = var.create_firewall_policy ? 1 : 0
  enable_telemetry                              = var.enable_telemetry
  name                                          = var.naming_map.firewall_policy.name
  location                                      = var.azure_location
  resource_group_name                           = var.resource_group_name
  firewall_policy_threat_intelligence_mode      = var.firewall_policy_threat_intelligence_mode
  firewall_policy_threat_intelligence_allowlist = var.firewall_policy_threat_intelligence_allowlist
  firewall_policy_sku                           = var.firewall_policy_policy_sku
  firewall_policy_intrusion_detection           = var.firewall_policy_intrusion_detection
  tags                                          = var.azure_resource_tags
  firewall_policy_base_policy_id                = var.firewall_policy_base_policy_id
  firewall_policy_dns                           = var.firewall_policy_dns

}
