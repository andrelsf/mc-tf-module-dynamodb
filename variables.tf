variable "environment" {
  description = "(Required) Define environment"
  type        = string
  nullable    = false
  default     = "dev"
  validation {
    condition     = contains(["dev", "hom", "prod"], var.environment)
    error_message = "Enviroment unsupported"
  }
}

variable "table_name" {
  description = "(Required) Define the table name for DynamoDB"
  type        = string
  nullable    = false
  validation {
    condition     = length(var.table_name) >= 3 && length(var.table_name) <= 255
    error_message = "Table name can not is empty"
  }
}

variable "stream_enabled" {
  description = "(Optional) Enables or disables the use of the DynamoDB Stream feature"
  type        = bool
  default     = false
}

variable "stream_view_type" {
  description = "(Optional) Required if sream_enabled equals true. StreamViewType determines what information is written to the table's stream"
  type        = string
  default     = "NEW_IMAGE"
  validation {
    condition     = contains(["KEYS_OLY", "NEW_IMAGE", "OLD_IMAGE", "NEW_AND_OLD_IMAGES"], var.stream_view_type)
    error_message = "Stream view type unsupported"
  }
}

variable "billing_mode" {
  description = "(Optional) Defines the billing mode for using DynamoDB"
  type        = string
  default     = "PAY_PER_REQUEST"
  validation {
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.billing_mode)
    error_message = "Billing mode unsupported"
  }
}

variable "hash_key" {
  description = "(Required) Defines hash key name and type for table DynamoDB"
  type = object({
    name = string
    type = string
  })
  nullable = false
  validation {
    condition     = length(var.hash_key.name) >= 3 && length(var.hash_key.name) <= 255
    error_message = "The attribute name can not is empty"
  }
  validation {
    condition     = contains(["S", "N", "B"], var.hash_key.type)
    error_message = "Hash Key type unsupported"
  }
}

variable "range_key" {
  description = "(Optional) Defines hash key name and type for table DynamoDB"
  type = object({
    name = string
    type = string
  })
  nullable = false
  validation {
    condition     = length(var.range_key.name) >= 3 && length(var.range_key.name) <= 255
    error_message = "The attribute name can not is empty"
  }
  validation {
    condition     = contains(["S", "N", "B"], var.range_key.type)
    error_message = "Range key unsupported"
  }
}

variable "ttl_enabled" {
  description = "(Optional) Enables or disables the use of the DynamoDB ttl feature"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
  description = "(Optional) Defines attribute name (column) that will be used for TTL"
  type        = string
  default     = ""
  validation {
    condition     = var.ttl_attribute_name == "" || (length(var.ttl_attribute_name) >= 3 && length(var.ttl_attribute_name) <= 255)
    error_message = "The ttl attribute name can not is empty"
  }
}

variable "pitr_enabled" {
  description = "(Optional) Enable or disable the use of DynamoDB PITR backup"
  type        = bool
  default     = false
}

variable "sse_kms_enabled" {
  description = "(Optional) Enable or disable the use of DynamoDB SSE"
  type        = bool
  default     = false
}

variable "sse_kms_key_arn" {
  description = "(Optional) Sets the KMS key ARN"
  type        = string
  default     = ""
  sensitive   = true
  validation {
    condition     = var.sse_kms_key_arn == "" || can(regex("arn:aws:(kms):\\w{2}-\\w+-\\d{1}:\\d{12}:(key|alias)/\\w", var.sse_kms_key_arn))
    error_message = "KMS Key ARN invalid format"
  }
}
