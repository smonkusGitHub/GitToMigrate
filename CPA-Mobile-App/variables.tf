# -------------------------------------------------
# Projects Variable
# -------------------------------------------------
variable "project_short_name" {
  description = "The project name for the solution, used for naming purposes."
  default = "ma"
  type        = string
}

variable "project_long_name" {
  description = "The project name for the solution, used for naming purposes."
  default = "mobileapp"
  type        = string
}


variable "environment_short_name" {
  description = "The environment name for the solution, used for naming purposes."
  default = "dev"
  type        = string
}

variable "location_short_name" {
  description = "The abbreviation of the Azure Region where the solution should exist."
  default = "ae"
  type        = string
  
}

variable "company_short_name" {
  description = "Abbreviation of the company name to make all Azure resources unique within the Azure Tenant."
  default = "cpa"
  type        = string

}

variable "location" {
  description = "rg location"
  type        = string
}

variable "tags" {
  type = map(string)
}

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

variable "ampls_subscription_id" {
  description = "Specifies the subscription id"
  type        = string
}

variable "client_id" {
  description = "Specifies the client id for the azure service principal"
  type        = string
}

variable "sit_sql_admin_login" {
  description = "SQL Admin Login"
  type        = string
  sensitive   = false
}

variable "sit_sql_admin_password" {
  description = "SQL Admin Password"
  type        = string
  sensitive   = true    
}

variable "client_secret" {
  description = "Specifies the client secret for the azure service principal"
  type        = string
  sensitive   = true
}

variable "sit_private_endpoint_subnet_id" {
  description = "Specifies the private endpoint subnet id"
  type        = string
}

# -------------------------------------------------
# Local Variable
# -------------------------------------------------
variable "containers_course" {
  description = "List of storage containers to create for courses"
  type = list(object({
    name                  = string
    container_access_type = string
  }))
}

variable "authorization_rules_shared_course" {
  description = "Authorization rules for the Service Bus namespace in shared for courses"
  type = map(object({
    name   = optional(string, null)
    send   = optional(bool, false)
    listen = optional(bool, false)
    manage = optional(bool, false)
  }))
}

variable "storage_containers_podcast" {
  description = "List of storage containers to create for podcast"
  type = list(object({
    name                  = string
    container_access_type = string
  }))
}

variable "storage_queues_podcast" {
  description = "List of storage queues to create for podcast"
  type = list(object({
    name                  = string    
  }))
}

variable "storage_tables_podcast" {
  description = "List of storage tables to create for podcast"
  type = list(object({
    name                  = string    
  }))
}

variable "private_endpoints_service_connections_podcast" {
  description = "List of private end point connections to create for podcast"
  type = list(object({
    name                    = string  # private endpoint resource name.
    subresource_name        = string  # subresource type, like "blob", "queue", "table"
    network_interface_name  = string  # NIC (network interface) name
  }))
}

variable "private_dns_zone_ids_by_type" {
  description = "Mapping between subresource type and DNS zone IDs"
  type        = map(string)
  default = {
    blob  = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
    queue = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.queue.core.windows.net"
    table = "/subscriptions/944e28c1-401a-4c69-bf58-dfd5567c3b02/resourceGroups/ae-prod-dns-rg/providers/Microsoft.Network/privateDnsZones/privatelink.table.core.windows.net"
  }
}

variable "private_dns_zone_ids_by_name" {
  description = "Mapping between subresource type and DNS zone name"
  type        = map(string)
  default = {
    blob  = "privatelink.blob.core.windows.net"
    queue = "privatelink.queue.core.windows.net"
    table = "privatelink.table.core.windows.net"
  }
}

variable "private_endpoints" {
  description = "List of private endpoints to create for storage account"
  type = list(object({
    name              = string
    subresource_name  = string # blob, queue, table, etc.
  }))
}
