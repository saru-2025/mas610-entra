provider "databricks" {
  host  = var.databricks_host != "" ? var.databricks_host : env("DATABRICKS_HOST")
  token = var.databricks_token != "" ? var.databricks_token : env("DATABRICKS_TOKEN")
}