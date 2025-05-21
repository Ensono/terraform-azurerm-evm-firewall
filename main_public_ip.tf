

module "public_ip_address" {

  source  = "Azure/avm-res-network-publicipaddress/azurerm"
  version = "0.2.0"

  resource_group_name = var.resource_group_name
  name                = var.naming_map.public_ip.name
  location            = var.azure_location
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  zones               = var.azure_location_zones
  tags                = var.azure_resource_tags
  sku_tier            = var.public_ip_sku_tier
  enable_telemetry    = var.enable_telemetry
}
