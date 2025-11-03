terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.20.0"
    }
  }
}

# Use PAT authentication (simpler for local runs)
provider "databricks" {
  host  = "https://adb-3086481039813864.4.azuredatabricks.net"
  token = var.databricks_token
}
