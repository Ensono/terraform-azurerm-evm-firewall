


variable "public_ip_sku" {
  type        = string
  description = "The SKU of the public IP address."
  default     = "Standard"
  validation {
    condition     = can(regex("^(Basic|Standard)$", var.public_ip_sku))
    error_message = "The SKU must be either 'Basic' or 'Standard'."
  }

}

variable "public_ip_sku_tier" {
  type        = string
  description = "The tier of the SKU of the public IP address."
  default     = "Regional"
  validation {
    condition     = can(regex("^(Global|Regional)$", var.public_ip_sku_tier))
    error_message = "The SKU tier must be either 'Global' or 'Regional'."
  }
}

variable "allocation_method" {
  type        = string
  description = "The allocation method to use."
  default     = "Static"
  validation {
    condition     = can(regex("^(Static|Dynamic)$", var.allocation_method))
    error_message = "The allocation method must be either 'Static' or 'Dynamic'."
  }
}
