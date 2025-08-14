# -------------------------------------------------
# Variables in Terraform Cloud
# -------------------------------------------------

variable "tenant_id" {
  description = "Specifies the tenant id for the azure tenant"
  type        = string
}

variable "subscription_id" {
  description = "Specifies the subscription id"
  type        = string
}

variable "client_id" {
  description = "Specifies the client id for the azure service principal"
  type        = string
}

variable "client_secret" {
  description = "Specifies the client secret for the azure service principal"
  type        = string
  sensitive   = true
}

variable "location" {
  type        = string
  default     = "australiaeast"
  description = "The location for the resource"
}

variable "resource_tags" {
  type = map(string)
  default = {
    "Product"       = "CoreInfra"
    "Environment"   = "Development"
    "Support Owner" = "Infra Team"
  }
}