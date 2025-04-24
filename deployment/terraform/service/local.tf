locals {
  service_name = "${var.app_name}_${var.environment}"
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}