resource "random_string" "suffix" {
  length  = 8
  lower   = true
  upper   = false
  special = false
}