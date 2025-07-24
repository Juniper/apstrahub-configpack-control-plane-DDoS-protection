#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

variable "blueprint_id" {
  type = string
}

variable "name" {
  type    = string
  default = "Control Plane DDoS Protection"
}

variable "configlet_scope" {
  type        = string
  default     = "role in [\"superspine\", \"spine\", \"leaf\", \"access\"]"
  description = "Selects devices where configlet should be applied. Example: `hostname in [\"spine1\", \"spine2\"]`"
}

variable "aggregate_bandwidth" {
  type = number
  default = 1000
  description = "Aggregate rate in packets per second"
}

variable "aggregate_burst" {
  type = number
  default = 400
  description = "Aggregate burst size in packets"
}
