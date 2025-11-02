
# -----------------------------
# Global environment variables
# -----------------------------
variable "subscription_id" {
  description = "Azure Subscription ID used for MAS610 Platform"
  type        = string
  default     = "f4eb400d-e379-4fb2-a669-5ad89034cc35"
}

variable "resource_group" {
  description = "Resource Group where ADF + Databricks reside"
  type        = string
  default     = "rg-mas610-platform"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "eastus"
}

# -----------------------------
# Databricks workspace details
# -----------------------------
variable "databricks_workspace_id" {
  description = "Full ARM ID of the Databricks workspace"
  type        = string
  default     = "/subscriptions/f4eb400d-e379-4fb2-a669-5ad89034cc35/resourceGroups/rg-mas610-platform/providers/Microsoft.Databricks/workspaces/dbw_analytics"
}

variable "cluster_name" {
  description = "Name for Databricks cluster created by Terraform"
  type        = string
  default     = "mas610_dev_cluster"
}

variable "email_notification" {
  description = "Email address for Databricks job failure notifications"
  type        = string
  default     = "saritha.mpragada@outlook.com"
}
