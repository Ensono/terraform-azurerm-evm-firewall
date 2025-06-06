# Ensono Verified Module (EVM) - Azure Terraform Firewall and Firewall Policies
An Azure Terraform Ensono Verified Module (EVM) designed to abstract the complexity of provisioning resources related to:
* Azure Firewall
* Azure Firewall parent policies
* Azure Firewall child policies

---

<!-- BEGIN_TF_DOCS -->
## Contributing
This repository uses the [pre-commit](https://pre-commit.com/) git hook framework which can update and format some files enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage
Examples can be found at the bottom taken from the `examples` directory.


## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| firewall | Azure/avm-res-network-azurefirewall/azurerm | 0.3.0 |
| firewall\_policy | Azure/avm-res-network-firewallpolicy/azurerm | 0.3.2 |
| public\_ip\_address | Azure/avm-res-network-publicipaddress/azurerm | 0.1.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocation\_method | The allocation method to use. | `string` | `"Static"` | no |
| azure\_location | The Azure target location for all resources managed by this module. | `string` | n/a | yes |
| azure\_location\_zones | The Azure target location available zones | `set(number)` | n/a | yes |
| azure\_resource\_tags | Resource tags to add to all resources managed by this module. | `map(string)` | n/a | yes |
| create\_firewall\_policy | condition whetehr the FW policy to be created or not | `string` | n/a | yes |
| diagnostic\_settings | A map of diagnostic settings to create on the Firewall. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.<br/><br/>  - `name` - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.<br/>  - `log_categories` - (Optional) A set of log categories to send to the log analytics workspace. Defaults to `[]`.<br/>  - `log_groups` - (Optional) A set of log groups to send to the log analytics workspace. Defaults to `["allLogs"]`.<br/>  - `metric_categories` - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to `["AllMetrics"]`.<br/>  - `log_analytics_destination_type` - (Optional) The destination type for the diagnostic setting. Possible values are `Dedicated` and `AzureDiagnostics`. Defaults to `Dedicated`.<br/>  - `workspace_resource_id` - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.<br/>  - `storage_account_resource_id` - (Optional) The resource ID of the storage account to send logs and metrics to.<br/>  - `event_hub_authorization_rule_resource_id` - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.<br/>  - `event_hub_name` - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.<br/>  - `marketplace_partner_resource_id` - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs. | <pre>map(object({<br/>    name                                     = optional(string, null)<br/>    log_categories                           = optional(set(string), [])<br/>    log_groups                               = optional(set(string), ["allLogs"])<br/>    metric_categories                        = optional(set(string), ["AllMetrics"])<br/>    log_analytics_destination_type           = optional(string, "Dedicated")<br/>    workspace_resource_id                    = optional(string, null)<br/>    storage_account_resource_id              = optional(string, null)<br/>    event_hub_authorization_rule_resource_id = optional(string, null)<br/>    event_hub_name                           = optional(string, null)<br/>    marketplace_partner_resource_id          = optional(string, null)<br/>  }))</pre> | `{}` | no |
| enable\_telemetry | This variable controls whether or not telemetry is enabled for the module.<br/>For more information see https://aka.ms/avm/telemetryinfo.<br/>If it is set to false, then no telemetry will be collected. | `bool` | `true` | no |
| firewall\_ip\_configuration\_subnetid | The subnet ID for the firewall IP configuration. | `string` | n/a | yes |
| firewall\_management\_ip\_configuration | - `name` - (Required) Specifies the name of the IP Configuration.<br/>- `public_ip_address_id` - (Required) The ID of the Public IP Address associated with the firewall.<br/>- `subnet_id` - (Required) Reference to the subnet associated with the IP Configuration. Changing this forces a new resource to be created. | <pre>object({<br/>    name                 = string<br/>    public_ip_address_id = string<br/>    subnet_id            = string<br/>  })</pre> | `null` | no |
| firewall\_policy\_base\_policy\_id | (Optional) The ID of the base Firewall Policy. | `string` | `null` | no |
| firewall\_policy\_dns | - `proxy_enabled` - (Optional) Whether to enable DNS proxy on Firewalls attached to this Firewall Policy? Defaults to `false`.<br/>- `servers` - (Optional) A list of custom DNS servers' IP addresses. | <pre>object({<br/>    proxy_enabled = optional(bool)<br/>    servers       = optional(list(string))<br/>  })</pre> | <pre>{<br/>  "proxy_enabled": true,<br/>  "servers": []<br/>}</pre> | no |
| firewall\_policy\_id | (Optional) The ID of the Firewall Policy applied to this Firewall. | `string` | `null` | no |
| firewall\_policy\_intrusion\_detection | - `mode` - (Optional) In which mode you want to run intrusion detection: `Off`, `Alert` or `Deny`.<br/>- `private_ranges` - (Optional) A list of Private IP address ranges to identify traffic direction. By default, only ranges defined by IANA RFC 1918 are considered private IP addresses.<br/><br/>---<br/>`signature_overrides` block supports the following:<br/>- `id` - (Optional) 12-digit number (id) which identifies your signature.<br/>- `state` - (Optional) state can be any of `Off`, `Alert` or `Deny`.<br/><br/>---<br/>`traffic_bypass` block supports the following:<br/>- `description` - (Optional) The description for this bypass traffic setting.<br/>- `destination_addresses` - (Optional) Specifies a list of destination IP addresses that shall be bypassed by intrusion detection.<br/>- `destination_ip_groups` - (Optional) Specifies a list of destination IP groups that shall be bypassed by intrusion detection.<br/>- `destination_ports` - (Optional) Specifies a list of destination IP ports that shall be bypassed by intrusion detection.<br/>- `name` - (Required) The name which should be used for this bypass traffic setting.<br/>- `protocol` - (Required) The protocols any of `ANY`, `TCP`, `ICMP`, `UDP` that shall be bypassed by intrusion detection.<br/>- `source_addresses` - (Optional) Specifies a list of source addresses that shall be bypassed by intrusion detection.<br/>- `source_ip_groups` - (Optional) Specifies a list of source IP groups that shall be bypassed by intrusion detection. | <pre>object({<br/>    mode           = optional(string)<br/>    private_ranges = optional(list(string))<br/>    signature_overrides = optional(list(object({<br/>      id    = optional(string)<br/>      state = optional(string)<br/>    })))<br/>    traffic_bypass = optional(list(object({<br/>      description           = optional(string)<br/>      destination_addresses = optional(set(string))<br/>      destination_ip_groups = optional(set(string))<br/>      destination_ports     = optional(set(string))<br/>      name                  = string<br/>      protocol              = string<br/>      source_addresses      = optional(set(string))<br/>      source_ip_groups      = optional(set(string))<br/>    })))<br/>  })</pre> | `null` | no |
| firewall\_policy\_policy\_sku | (Optional) The SKU Tier of the Firewall Policy. Possible values are `Standard`, `Premium` and `Basic`. Changing this forces a new Firewall Policy to be created. | `string` | `null` | no |
| firewall\_policy\_threat\_intelligence\_allowlist | - `fqdns` - (Optional) A list of FQDNs that will be skipped for threat detection.<br/>- `ip_addresses` - (Optional) A list of IP addresses or CIDR ranges that will be skipped for threat detection. | <pre>object({<br/>    fqdns        = optional(set(string))<br/>    ip_addresses = optional(set(string))<br/>  })</pre> | `null` | no |
| firewall\_policy\_threat\_intelligence\_mode | (Optional) The operation mode for Threat Intelligence. Possible values are `Alert`, `Deny` and `Off`. Defaults to `Alert`. | `string` | `null` | no |
| firewall\_private\_ip\_ranges | (Optional) A list of SNAT private CIDR IP ranges, or the special string `IANAPrivateRanges`, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918. | `set(string)` | `null` | no |
| firewall\_sku\_name | (Required) SKU name of the Firewall. Possible values are `AZFW_Hub` and `AZFW_VNet`. Changing this forces a new resource to be created. | `string` | n/a | yes |
| firewall\_sku\_tier | (Required) SKU tier of the Firewall. Possible values are `Premium`, `Standard` and `Basic`. | `string` | `"basic"` | no |
| naming\_map | A map containing Azure resource anmes aligned to the Cloud Adoption Framework. | `any` | n/a | yes |
| network\_resource\_group\_name | The resource group where the network resources are  deployed. Firewall must be created in network resource group | `string` | n/a | yes |
| public\_ip\_sku | The SKU of the public IP address. | `string` | `"Standard"` | no |
| public\_ip\_sku\_tier | The tier of the SKU of the public IP address. | `string` | `"Regional"` | no |
| resource\_group\_name | The resource group where the resources will be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| firewall\_id | The resource ID of the firewall. |
| firewall\_ip\_configuration | The Private IP address of the Azure Firewall. |
| firewall\_name | The name of the firewall. |
| firewall\_policy\_id | The resource ID of the firewall parent policy. |
| public\_ip\_address | The IP address of the firewall public ip. |
| public\_ip\_id | The resource ID of the firewall public ip address. |

## Examples
### Main
#### terraform.tfvars
```hcl
company_name_short                       = "ensevm"
subscription_name_short                  = "con"
module_names                             = ["firewall"]
azure_location                           = "eastus2"
network_resource_group_name              = "rg-ensrtf-eus2-prod-con-hub"
firewall_sku_name                        = "AZFW_VNet"
firewall_sku_tier                        = "Standard"
firewall_ip_configuration_subnetid       = "/subscriptions/xxxx-xxxx-xxxx-xxxx-xxxx/resourceGroups/rg-ensrtf-eus2-prod-con-hub/providers/Microsoft.Network/virtualNetworks/vnet-ensrtf-eus2-prod-con-hub/subnets/AzureFirewallSubnet"
firewall_policy_threat_intelligence_mode = "Alert"
firewall_policy_policy_sku               = "Standard"




/*
Sensitive inputs should be passed as pipeline environment variables

azure_subscription_id = "xxx"
*/
```

#### example.tf
```hcl

module "hub_firewall" {
  source                      = "../../"
  network_resource_group_name = var.network_resource_group_name
  azure_location              = azurerm_resource_group.modules["firewall"].location
  resource_group_name         = azurerm_resource_group.modules["firewall"].name
  azure_location_zones        = module.azure_regions.regions_by_name[var.azure_location].zones
  naming_map                  = local.name_map["firewall"]
  azure_resource_tags         = local.resource_tags

  #Firewall Configurations
  firewall_sku_name                  = var.firewall_sku_name
  firewall_sku_tier                  = var.firewall_sku_tier
  firewall_ip_configuration_subnetid = var.firewall_ip_configuration_subnetid
  # Firewall Policy Configurations

  create_firewall_policy                   = true
  firewall_policy_threat_intelligence_mode = var.firewall_policy_threat_intelligence_mode
  firewall_policy_policy_sku               = var.firewall_policy_policy_sku
}
```
<!-- END_TF_DOCS -->
