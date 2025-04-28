locals {
  service_name = "${var.app_name}-${terraform.workspace}"
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}