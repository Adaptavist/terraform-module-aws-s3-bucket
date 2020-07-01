variable "domain" {
  type        = string
  description = "domain"
}

variable "index_document" {
  type    = string
  default = "index.html"
}

variable "error_document" {
  type    = string
  default = "error.html"
}

variable "policy" {
  type        = string
  description = "IAM policy attached to the bucket"
  default     = null
}

variable "routing_rules" {
  type        = string
  description = "Routing rules JSON"
  default     = null
}

variable "logging_enabled" {
  type        = bool
  description = "Do you want to enable access logging"
  default     = false
}

variable "logging_config" {
  type = object({
    bucket = string
    prefix = string
  })
  description = "access log configuration"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "tags applied to the resources"
  default     = {}
}