provider "databricks" {
  # Use variables for host and token. In CI, pass them via -var or set in a secure var file.
  host  = var.databricks_host
  token = var.databricks_token
}
