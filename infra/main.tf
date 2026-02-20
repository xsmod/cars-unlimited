# ------------------------------------------------------------------------------
# Main Terraform configuration for Cars Unlimited application
# ------------------------------------------------------------------------------

locals {

  # General configuration
  location = var.location
  hostname = var.hostname

  # Deployment slots configuration
  slots = {
    main = {
      name      = "main"
      always_on = true
    }
    staging = {
      name = "staging"
    }
    dev = {
      name = "dev"
    }
  }
}
