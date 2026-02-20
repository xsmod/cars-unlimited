variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
  default     = "spaincentral"
}

variable "hostname" {
  description = "Public hostname for the Cars Unlimited application."
  type        = string
  default     = "cars-unlimited.xsmod.io"
}
